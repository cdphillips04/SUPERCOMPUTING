#!/bin/bash
set -ueo pipefail

file_name=$1

echo "The total number of sequences is $(seqtk comp $1 | wc -l)"
