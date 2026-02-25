#!/bin/bash
set -ueo pipefail

file_name=$1
num_sequences=$(seqtk comp ${file_name} | wc -l)
num_nucleotides=$(grep -v "^>" ${file_name} | tr -d "\n" | wc -c)
seq_name_length_table=$(seqtk comp ${file_name} | cut -f1,2)
echo "File Name: ${file_name}"
echo "The total number of sequences is ${num_sequences}"
echo "The total number of nucleotides is ${num_nucleotides}"
echo "This table contains the sequence names and lengths:"
echo "${seq_name_length_table}"
