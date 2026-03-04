#!/bin/bash

set -ueo pipefail

# make sure script 1 is executable and run it 
chmod +x ./scripts/01_download_data.sh
./scripts/01_download_data.sh

# make sure script 2 is executable
chmod +x ./scripts/02_run_fastp.sh

# run script 2 for each forward file in the raw data folder
for FWD in data/raw/*_R1_*
do
	./scripts/02_run_fastp.sh $FWD
done
