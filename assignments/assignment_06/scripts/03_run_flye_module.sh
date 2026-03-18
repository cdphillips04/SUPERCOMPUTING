#!/bin/bash

set -ueo pipefail

# load module on HPC
module load Flye/gcc-11.4.1/2.9.6

# make output directory
mkdir ./assemblies/assembly_module

# run flye
flye --nano-raw ./data/SRR33939694.fastq.gz --out-dir ./assemblies/assembly_module --threads 6

# rename fasta file
mv ./assemblies/assembly_module/assembly.fasta ./assemblies/assembly_module/module_assembly.fasta
mv ./assemblies/assembly_module/flye.log ./assemblies/assembly_module/module_flye.log

# remove everything besides module_assembly.fasta and module_flye.log
cd ./assemblies/assembly_module
rm -r $(ls | grep -v -e 'module_assembly.fasta' -e 'module_flye.log')
cd ../..


