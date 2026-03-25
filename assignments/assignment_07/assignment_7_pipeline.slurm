#!/bin/bash
#SBATCH --job-name=assignment_7
#SBATCH --nodes=1 # how many physical machines in the cluster
#SBATCH --ntasks=1 # how many separate 'tasks' (stick to 1)
#SBATCH --cpus-per-task=16 # how many cores (bora max is 20)
#SBATCH --time=720 # d-hh:mm:ss or just No. of minutes
#SBATCH --mem=40G # how much physical memory (all by default)
#SBATCH --mail-type=FAIL,BEGIN,END # when to email you
#SBATCH --mail-user=cdphillips@wm.edu # who to email
#SBATCH -o ./output/assignment_7.out #STDOUT to file (%j is jobID)
#SBATCH -e ./output/assignment_7.err #STDERR to file (%j is jobID)

# run download data script
./scripts/01_download_data.sh

# run fastp clean script
./scripts/02_clean_reads.sh

# run mapping and extracting script
./scripts/03_map_reads.sh


