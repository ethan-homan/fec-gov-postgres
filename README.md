# Load FEC Bulk Data into Postgres

**Please read [this note from the Federal Election Commission](https://www.fec.gov/updates/sale-or-use-contributor-information/)
on permissible use of this data before cloning or contributing**

The FEC publishes individual and PAC contributions to candidates in a
[searchable web app](https://www.fec.gov/data/) and as
[bulk downloads](https://www.fec.gov/data/browse-data/?tab=bulk-data).

The goal of this project is to lower the barrier to entry for analysis of money in US politics by loading the bulk downloads into a Postgres database. This helps in a couple of ways:
 - Some of the tables (particularly the individual_contributions table) get prohibitively large for ad-hoc analysis using pandas or excel on a normal laptop. Whether or not Postgres will solve this for you depends on your machine, the number of years of data you load, and the queries you run, but it will help in many situations.
 - The normalization of the dataset across a few tables tables lends itself to manipulation using SQL. There are some examples at the end of this README that help demonstrate this.

## Getting Started

### Setting up Postgres

#### Using Homebrew (OSX)

If you don't have Homebrew go [here](https://brew.sh/) and install it.

Then run this to install postgres on your machine and then start it as a service. If you do this,
then there is no further configuration needed to use the scripts here.

```bash
brew install postres
brew services start postgres
```

### Loading Data

This repo consists of two components right now:
1. A set of postgres table definitions that are compatible with the schema published by the FEC and
   the data available in their bulk downloads. These are annotated with the comments in the
   FEC's data definition files.
2. A bash script that downloads files from the FEC's public S3 bucket, does some minor character formatting to make sure the files are ready to be loaded, and copies them into the tables defined in 1.

It can be used like this to load data from the last two election cycles -- 2020 and 2018 -- into a postgres database:
```bash
sh load-fec-year.sh 2020 2018
```

Specify postgres configurations in environment variables by following the official
[postgres documentation](https://www.postgresql.org/docs/9.3/libpq-envars.html) and
running something like:

```bash
PGHOST=localhost PGUSER=postgres PGPASSWORD=mysecretpass sh load-fec-year.sh 2020 2018
```

## Schema Changes

All tables have an additional column added called `file_year`. This corresponds to the election
cycle that the bulk download files were associated with. Adding `file_year` makes it easy to add
files from multiple election cycles into the same database and run queries across all of them.

## Starter Queries

The [FEC documentation](https://www.fec.gov/data/browse-data/?tab=bulk-data) is very thorough so reviewing that is essential for
navigating the schema -- just be aware that the `file_year` is being added to all tables.

For example, this query will show expenditures by committees in opposition of a candidate
by election cycle:

```sql
SELECT
    SUM(ccc.transaction_amt) transaction_total,
    cm.cmte_nm committee_name,
    cm.file_year,
    cand.cand_name candidate_name
FROM committee_candidate_contributions ccc
JOIN committee_master cm
ON cm.cmte_id = ccc.cmte_id AND cm.file_year = ccc.file_year
JOIN candidate_master cand
ON cand.cand_id = ccc.cand_id AND cand.file_year = ccc.file_year
WHERE (ccc.transaction_tp = '24A' OR ccc.transaction_tp = '24N') -- https://www.fec.gov/campaign-finance-data/transaction-type-code-descriptions/
GROUP BY
    cm.file_year,
    ccc.cand_id,
    cand.cand_name,
    cm.cmte_nm
ORDER BY transaction_total DESC
LIMIT 100
```

This will show the employers who are listed most often in individual contributions
to campaign committees by election cycle:

```sql
SELECT employer, file_year, count(*) distinct_contributions
FROM individual_contributions ci
JOIN committee_master cm
USING(cmte_id, file_year)
GROUP BY employer, file_year
ORDER BY distinct_contributions DESC
LIMIT 100
```
