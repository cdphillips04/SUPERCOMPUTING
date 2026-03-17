#!/bin/bash

set -ueo pipefail

# set up environment
module load miniforge3/24.9.2-0
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate bbmap-env

cd data

# get data
wget https://zenodo.org/records/15733378/files/ecoli_and_lambda.tar
tar -xf ecoli_and_lambda.tar


# run bbmap
bbmap.sh ref=ecoli_bl21de3.fasta in=lambda_reads.fastq out=mapping.sam nodisk=t ambiguous=best minid=0.9 threads=2

mv mapping.sam ../output

# clean up
conda deactivate
rm ecoli_and_lambda.tar
