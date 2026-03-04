#!/bin/bash

# get names for forward and reverse input files
FWD_IN=$1
REV_IN=${FWD_IN/_R1_/_R2_}

# change path from raw to trimmed for trimmed data
FWD_TRIM=${FWD_IN/raw/trimmed}
REV_TRIM=${REV_IN/raw/trimmed}

# include trimmed in the file name
FWD_OUT=${FWD_TRIM/.fastq.gz/.trimmed.fastq.gz}
REV_OUT=${REV_TRIM/.fastq.gz/.trimmed.fastq.gz}

# set path for log files to go to log folder instead of data folder by replacing data/raw with log
# then remove anything after _R1 or _R2, including it, to name the log files
LOG_PATH=${FWD_IN/data\/raw/log}
LOG_NAME=${LOG_PATH%%_R[12]*}

#fastp --in1 $FWD_IN --in2 $REV_IN --out1 $FWD_OUT --out2 $REV_OUT --json $LOG_NAME.json --html $LOG_NAME.html

fastp --in1 $FWD_IN --in2 $REV_IN --out1 $FWD_OUT --out2 $REV_OUT --json /dev/null --html /dev/null --trim_front1 8 --trim_front2 8 --trim_tail1 20 --trim_tail2 20 --n_base_limit 0 --length_required 100 --average_qual 20
