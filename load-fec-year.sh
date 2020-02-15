#!/usr/bin/env bash

S3_BUCKET_URL='https://cg-519a459a-0ea3-42c2-b7bc-fa1143481f74.s3-us-gov-west-1.amazonaws.com/bulk-downloads'

full_url() {
  dataset_abbreviation=$1
  year=$2
  echo $S3_BUCKET_URL/$year/$dataset_abbreviation${year: -2}.zip
}

download_year() {
  year=$1
  mkdir -p ./data/$year
  echo "Downloading files for year $year:"
  for dataset_tuple in "cn candidate_master" "ccl candidate_committee_linkages" "webl house_senate_current_campaigns" "cm committee_master" "webk pac_summary" "pas2 committee_candidate_contributions" "oth committee_transactions" "oppexp operating_expenditures"
    do
      set -- $dataset_tuple
      echo  "downloading $2 ..."
      echo  $(full_url $1 $year)
      curl -s $(full_url $1 $year) | \
        funzip | \
        iconv -c -t UTF-8 | \
        tr -d '\010' \
        > "./data/$year/$2.txt"
    done
}

pg_load_year() {
  year=$1
  for table_def_file in `find sql/table_definitions/*.sql -print`
    do
      psql --file $table_def_file
      pg_load_table_year $(basename $table_def_file .sql) $year
    done
}

pg_register_functions() {
  for function_def in `find sql/functions/*.sql -print`
    do
      psql --file $function_def
    done
}

pg_load_table_year() {
  table=$1
  year=$2
  psql -c "SELECT load_file('$PWD/data/', '$year', '$table.txt', '$table')"
}

pg_register_functions
for year in "$@"
do
  download_year $year
  pg_load_year $year
done
