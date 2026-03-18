#!/bin/bash

set -ueo pipefail

module load miniforge3
source /sciclone/apps/miniforge3-24.9.2-0/etc/profile.d/conda.sh

conda create -y -n flye-env flye -c bioconda

conda activate flye-env

flye -v

conda env export --no-builds > flye-env.yml

