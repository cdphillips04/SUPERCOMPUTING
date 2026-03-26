#!/bin/bash

set -ueo pipefail

# paths to data and output directories that are in scr10
HW_DIR=${HOME}/scr10/assignment_7
DATA_DIR=${HW_DIR}/data
RAW_DIR=${DATA_DIR}/raw
CLEAN_DIR=${DATA_DIR}/clean
DOG_DIR=${DATA_DIR}/dog_reference
OUTPUT_DIR=${HW_DIR}/output

# call fastp on forward and reverse reads
for f in $(cat ./data/SraRunTable.csv | cut -d "," -f 1 | tail -n +2)
do 
	FWD=${RAW_DIR}/${f}_1.fastq.gz
	REV=${FWD/_1.fastq.gz/_2.fastq.gz}
	FWDOUT=${CLEAN_DIR}/${f}_1_clean.fastq.gz
	REVOUT=${FWDOUT/_1_clean.fastq.gz/_2_clean.fastq.gz}
	fastp -i ${FWD} -I ${REV} -o ${FWDOUT} -O ${REVOUT} --html /dev/null --json /dev/null -w 16
done
