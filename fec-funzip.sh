#!/usr/bin/env bash

S3_BUCKET_URL='https://cg-519a459a-0ea3-42c2-b7bc-fa1143481f74.s3-us-gov-west-1.amazonaws.com/bulk-downloads'

full_url() {
  dataset_abbreviation=$1
  year=$2
  echo $S3_BUCKET_URL/$year/$dataset_abbreviation${year: -2}.zip
}

curl $(full_url weball 2020) | funzip > './data/2020-weball.txt'