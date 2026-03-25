#!/bin/bash

# download data using the run table
for f in $(cat ./data/SraRunTable.csv | cut -d "," -f 1 | tail -n +2)
do fasterq-dump ${f} -O ./data/raw --gzip
done

# download dog reference genome
datasets download genome taxon "Canis familiaris" --reference --filename ./data/dog_reference/dog_reference_genome.zip

# unzip dog file and only get fna file
unzip -j ./data/dog_reference/dog_reference_genome.zip  "*.fna" -d ./data/dog_reference

# remove dog zip file
rm ./data/dog_reference/dog_reference_genome.zip

# rename fna file
mv ./data/dog_reference/*.fna ./data/dog_reference/dog_reference_genome.fna
