#!/bin/bash

set -ueo pipefail

# paths to data and output directories that are in scr10
HW_DIR=${HOME}/scr10/assignment_7
DATA_DIR=${HW_DIR}/data
RAW_DIR=${DATA_DIR}/raw
CLEAN_DIR=${DATA_DIR}/clean
DOG_DIR=${DATA_DIR}/dog_reference
OUTPUT_DIR=${HW_DIR}/output

# download data using the run table
for f in $(cat ./data/SraRunTable.csv | cut -d "," -f 1 | tail -n +2)
do 
	fasterq-dump "${f}" -O "${RAW_DIR}" -e 8
	gzip "${RAW_DIR}/${f}_1.fastq"
	gzip "${RAW_DIR}/${f}_2.fastq"
done

# download dog reference genome
datasets download genome taxon "Canis familiaris" --reference --filename "${DOG_DIR}/dog_reference_genome.zip"

# unzip dog file and only get fna file
unzip -j "${DOG_DIR}/dog_reference_genome.zip"  "*.fna" -d "${DOG_DIR}"

# remove dog zip file
rm ${DOG_DIR}/dog_reference_genome.zip

# rename fna file
mv ${DOG_DIR}/*.fna ${DOG_DIR}/dog_reference_genome.fna
