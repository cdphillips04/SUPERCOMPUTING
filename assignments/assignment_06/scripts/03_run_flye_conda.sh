#!/bin/bash

set -ueo pipefail

# load miniforge3 and activate flye-env
module load miniforge3/24.9.2-0
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate flye-env

# make output directory
mkdir ./assemblies/assembly_conda

# run flye
flye --nano-raw ./data/SRR33939694.fastq.gz --out-dir ./assemblies/assembly_conda --threads 6

# rename fasta file and log file
mv ./assemblies/assembly_conda/assembly.fasta ./assemblies/assembly_conda/conda_assembly.fasta
mv ./assemblies/assembly_conda/flye.log ./assemblies/assembly_conda/conda_flye.log

# remove everything besides conda_assembly.fasta and flye.log
cd ./assemblies/assembly_conda
rm -r $(ls | grep -v -e 'conda_assembly.fasta' -e 'conda_flye.log')
cd ../..

# deactivate environment
conda deactivate
