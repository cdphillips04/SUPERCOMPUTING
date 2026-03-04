#!/bin/bash

set -ueo pipefail

chmod +x ./scripts/01_download_data.sh
./scripts/01_download_data.sh

chmod +x ./scripts/02_run_fastp.sh
for FWD in data/raw/*_R1_*
do
	./scripts/02_run_fastp.sh $FWD
done
