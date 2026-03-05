#!/bin/bash

set -ueo pipefail

# makes a new directory for data that contains a raw folder and clean folder, and an output directory
# gets tarball
# moves tarball into raw data folder
# unzips tarball
./scripts/01_prep_data.sh

# remove tarball from raw data folder
./scripts/03_cleanup.sh

# run seqkit stats on the fastq files in raw data folder and put output in txt file in the output directory
./scripts/02_get_stats.sh


