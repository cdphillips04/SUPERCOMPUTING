#!/bin/bash

set -ueo pipefail

# make directories for data and output files in scr10
HW_DIR=${HOME}/scr10/assignment_7
DATA_DIR=${HW_DIR}/data
RAW_DIR=${DATA_DIR}/raw
CLEAN_DIR=${DATA_DIR}/clean
DOG_DIR=${DATA_DIR}/dog_reference
OUTPUT_DIR=${HW_DIR}/output

mkdir -p $DATA_DIR $OUTPUT_DIR
mkdir -p $RAW_DIR $CLEAN_DIR $DOG_DIR
