#!/bin/bash
set -ueo pipefail

# or ls -1a $1 | wc -l works too 
num_d=$(ls -la $1| grep -v "total" | wc -l)

echo "There are ${num_d} files and directories"
