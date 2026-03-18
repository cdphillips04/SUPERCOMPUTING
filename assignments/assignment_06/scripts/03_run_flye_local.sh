#!/bin/bash

set -ueo pipefail

# make output directory
mkdir ./assemblies/assembly_local

# run flye
python ~/programs/Flye/bin/flye --nano-raw ./data/SRR33939694.fastq.gz --out-dir ./assemblies/assembly_local --threads 6

# rename fasta file and log file
mv ./assemblies/assembly_local/assembly.fasta ./assemblies/assembly_local/local_assembly.fasta
mv ./assemblies/assembly_local/flye.log ./assemblies/assembly_local/local_flye.log

# remove everything besides conda_assembly.fasta and flye.log
cd ./assemblies/assembly_local
rm -r $(ls | grep -v -e 'local_assembly.fasta' -e 'local_flye.log')
cd ../..
