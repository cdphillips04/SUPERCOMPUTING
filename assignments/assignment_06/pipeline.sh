#!/bin/bash

set -ueo pipefail

# make data and assemblies directories
mkdir data
mkdir assemblies

# download data
./scripts/01_download_data.sh

# install conda environment
./scripts/02_flye_2.9.6_conda_install.sh

# manual build
./scripts/02_flye_2.9.6_manual_build.sh

# run flye with conda
./scripts/03_run_flye_conda.sh

# run flye with module
./scripts/03_run_flye_module.sh

# run flye locally
./scripts/03_run_flye_local.sh

# show results
cat ./assemblies/assembly_conda/conda_flye.log | tail -n 10
cat ./assemblies/assembly_module/module_flye.log | tail -n 10
cat ./assemblies/assembly_local/local_flye.log | tail -n 10
