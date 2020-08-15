#!/usr/bin/env bash

S3_BUCKET_URL='https://cg-519a459a-0ea3-42c2-b7bc-fa1143481f74.s3-us-gov-west-1.amazonaws.com/bulk-downloads'

DATASET_TUPLES=(
   "cn candidate_master" \
   "ccl candidate_committee_linkages" \
   "webl house_senate_current_campaigns" \
   "cm committee_master" \
   "webk pac_summary" \
   "indiv individual_contributions" \
   "pas2 committee_candidate_contributions" \
   "oth committee_transactions" \
   "oppexp operating_expenditures"
)

full_url() {
  dataset_abbreviation=$1
  year=$2
  echo "$S3_BUCKET_URL/$year/$dataset_abbreviation${year: -2}.zip"
}

download_year() {
  year=$1
  mkdir -p "./data/$year"
  echo "Downloading files for year $year:"
  for dataset_tuple in "${DATASET_TUPLES[@]}"
    do
      set -- $dataset_tuple
      fec_abbreviation=$1
      table_name=$2
      url=$(full_url "$fec_abbreviation" "$year")
      echo  "downloading $table_name ..."
      if [ "$table_name" = "individual_contributions" ]
      then
        echo "this is a large file, it may take a few minutes"
      fi
      echo "$url"
      curl -s "$url" | \
      # funzip unzips the first file in the zip archive.
      # In most cases, the archive only has one file.
      # For some years, individual_contributions will throw a
      # warning because there are multiple files. This can be
      # ignored since (at the time of writing) the first file
      # in the archive contains all of the data. The subsequent
      # files contain the same data split into multiple files.
        funzip | \
      # There were a couple of rows that made postgres
      # panic on load. Enforcing UTF-8 and stripping out
      # backspace characters -- the dummy character I used
      # because postgres needs a quote character to
      # load CSVs -- was enough to deal with the the hiccups
      # I ran into back to 2006. I have not tested earlier years.
        iconv -c -t UTF-8 | \
        tr -d '\010' \
        > "./data/$year/$table_name.txt"
    done
}

pg_load_year() {
  year=$1
  for dataset_tuple in "${DATASET_TUPLES[@]}"
    do
      set -- $dataset_tuple
      table_name=$2
      echo "loading table $table_name into postgres ..."
      if [ "$table_name" = "individual_contributions" ]
      then
        echo "this is a large file, it may take a few minutes"
      fi
      pg_load_table_year "$table_name" "$year"
    done
}

pg_load_table_year() {
  table_name=$1
  year=$2
  psql -e -c "CREATE TABLE temp_$table_name AS SELECT * FROM $table_name WITH NO DATA;"
  psql -e -c "ALTER TABLE temp_$table_name DROP COLUMN file_year;"
  psql -e -c "\copy temp_$table_name from '$PWD/data/$year/$table_name.txt' (FORMAT CSV, DELIMITER('|'), HEADER FALSE, QUOTE E'\b');"
  psql -e -c "INSERT INTO $table_name ( SELECT DISTINCT ON ( temp_$table_name.* ) *, $year AS file_year FROM temp_$table_name ) ON CONFLICT DO NOTHING;"
  psql -e -c "DROP TABLE temp_$table_name;"
}

pg_create_tables() {
  for table_def_file in `find sql/*.sql -print`
    do
      echo "creating a table from $table_def_file"
      psql --file "$table_def_file"
    done
}

pg_create_tables
for year in "$@"
  do
    if (( $year % 2 == 0 ))
    then
      download_year "$year"
      pg_load_year "$year"
    else
      echo "The FEC indexes data per federal election cycle which is every other year."
      next_year=$(($year+1))
      echo "For transactions from $year try looking at the $next_year files."
    fi
  done
