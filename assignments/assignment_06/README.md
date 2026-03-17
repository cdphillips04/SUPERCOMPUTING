## Caroline Phillips (cdphillips), 3/17/26, Supercomputing Assignment 6

### Task 1: directory setup

```
mkdir assemblies
mkdir assemblies/assembly_conda assemblies/assembly_local assemblies/assembly_module
mkdir data
mkdir scripts
```

### Task 2: 01\_download\_data.sh to download raw ONT data

I named the file using `vi ./scripts/01_download_data.sh`. In the script, I used `cd data` to go into the data directory and `wget -O SRR33939694.fastq.gz https://zenodo.org/records/15730819/files/SRR33939694.fastq.gz?download=1` to download the data. The -O flag lets me name the output file “SRR33939694.fastq.gz”. Without this flag, the file name included “?download=1” which I did not want in the name.

`chmod +x ./scripts/01_download_data.sh` makes the script executable, and it can be run from the assignment\_06 directory with `./scripts/01_download_data.sh`.

### Task 3: 02\_flye\_2.9.6\_manual\_build.sh for local build of Flye v2.9.6

I named the file using `vi ./scripts/02_flye_2.9.6_manual_build.sh`. I used `cd ~/programs/` since the program should be in my programs directory. Then I followed the instructions provided, and added the location of the flye executable to my $PATH:
```
git clone https://github.com/fenderglass/Flye
cd Flye
make
```
 
I made the script executable with `chmod +x ./scripts/02_flye_2.9.6_manual_build.sh` and ran it from the assignment\_06 directory with `./scripts/02_flye_2.9.6_manual_build.sh`.

### Task 4: 02\_flye\_2.9.6\_conda\_install.sh for conda build of Flye v2.9.6

After making the file with `vi ./scripts/02_flye_2.9.6_conda_install.sh`, I loaded miniforge 3 and initialized conda. I used conda instead of mamba for `conda create -y -n flye-env flye -c bioconda` because I could not get mamba to work (maybe just user error, not sure). The environment can be activated with `conda activate flye-env` and deactivated with `conda deactivate`. The installed version is 2.9.6-b1802 as discovered with `flye -v`. I used `conda env export --no-builds > flye-env.yml` as instructed to get a list of dependencies and channels for the environment. The script deactivates the environment as the last step.


### Task 5: deciphering Flye

