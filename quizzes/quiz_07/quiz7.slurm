#!/bin/bash
#SBATCH --job-name=QUIZ7
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --time=1
#SBATCH --mem=1G
#SBATCH -o QUIZ7_%j.out
#SBATCH -e QUIZ7_%j.err
echo "Hello world!"
