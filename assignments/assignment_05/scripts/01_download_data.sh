#!/bin/bash

set -ueo pipefail

# open data/raw folder
cd ./data/raw/

# get data from link
wget https://gzahn.github.io/data/fastq_examples.tar

# extract data files
tar -xf fastq_examples.tar

# remove tar file
rm fastq_examples.tar
