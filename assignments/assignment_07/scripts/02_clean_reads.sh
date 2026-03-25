#!/bin/bash

set -ueo pipefail

# call fastp on forward and reverse reads
for f in $(cat ./data/SraRunTable.csv | cut -d "," -f 1 | tail -n +2)
do 
	FWD=./data/raw/${f}_1.fastq.gz
	REV=${FWD/_1.fastq.gz/_2.fastq.gz}
	FWDOUT=./data/clean/${f}_1_clean.fastq.gz
	REVOUT=${FWDOUT/_1_clean.fastq.gz/_2_clean.fastq.gz}
	fastp -i ${FWD} -I ${REV} -o ${FWDOUT} -O ${REVOUT} --html /dev/null --json /dev/null -w 16
done
