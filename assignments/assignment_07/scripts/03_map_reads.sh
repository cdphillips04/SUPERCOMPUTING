#!/bin/bash

set -ueo pipefail

# map reads using bbmap
for f in $(cat ./data/SraRunTable.csv | cut -d "," -f 1 | tail -n +2)
do 
	FWDOUT=./data/clean/${f}_1_clean.fastq.gz
	REVOUT=${FWDOUT/_1_clean.fastq.gz/_2_clean.fastq.gz}
	bbmap.sh -Xmx32g ref=./data/dog_reference/dog_reference_genome.fna in1=${FWDOUT} in2=${REVOUT} out=./output/${f}.sam minid=0.95 
	samtools view -F 4 ./output/${f}.sam > ./output/${f}_dog-matches.sam
done
