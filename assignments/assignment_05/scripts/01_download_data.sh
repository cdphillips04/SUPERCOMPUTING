#!/bin/bash

set -ueo pipefail

wget https://gzahn.github.io/data/fastq_examples.tar

tar -xf fastq_examples.tar

mv *.fastq.gz ../data/raw/

rm fastq_examples.tar
