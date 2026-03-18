## Caroline Phillips (cdphillips), 3/17/26, Supercomputing Assignment 6

### Task 1: directory setup

I set up my assignment\_06 directory using `mkdir scripts`.

The pipeline script makes the assemblies and data directories so the user doesn’t need to set that up themselves. The assembly directory for each method of running Flye will be made by the scripts.

I have the data and assemblies directories in my .gitignore.

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

After making the file with `vi ./scripts/02_flye_2.9.6_conda_install.sh`, I loaded miniforge 3 and initialized conda. I used conda instead of mamba for `conda create -y -n flye-env flye -c bioconda` because I could not get mamba to work (maybe just user error, not sure). The environment can be activated with `conda activate flye-env` and deactivated with `conda deactivate`. The installed version is 2.9.6-b1802 as discovered with `flye -v`. I used `conda env export --no-builds > flye-env.yml` as instructed to get a list of dependencies and channels for the environment. 

### Task 5: deciphering Flye

`flye --nano-raw ./data/SRR33939694.fastq.gz --out-dir ./assemblies --threads 6`

This command uses --nano-raw for nanopores, 6 cores, and puts outputs in the assemblies directory. For each of the 3 ways to run Flye below, I would change the output files to go to ./assemblies/name\_of\_env instead of just ./assemblies. ./data/SRR33939694.fastq.gz is the path to the data to use.

I found [this Flye manual](https://gensoft.pasteur.fr/docs/Flye/2.9/USAGE.html#:~:text=Input%20data%20preparation,might%20lead%20to%20assembly%20gaps.) to be helpful as it described the flags and parameters.

### Task 6A: conda 

The script 03\_run\_flye\_conda.sh is in the scripts directory and is made executable by `chmod +x ./scripts/03_run_flye_conda.sh`. It loads the miniforge3 model, activates flye-env, makes the assembly\_conda directory inside the assemblies directory, and runs the flye command that I wrote for task 5. The outputs are put in the assembly\_conda directory. I used the mv command to rename assembly.fasta to conda\_assembly.fasta and flye.log to conda\_flye.log, and then had the script go into assembly\_conda to remove all files that aren’t flye.log and conda\_assembly.fasta.

To remove these files, I used the command `rm -r $(ls | grep -v -e 'conda_assembly.fasta' -e 'conda_flye.log')`. I did command substitution to show everything in the directory, and selected everything not named one of the two specified files. These files and directories were then removed with rm -r, which deletes files, directories, and anything inside them.

The script can be run with the command `./scripts/03_run_flye_conda.sh`.

### Task 6B: module

The script 03\_run\_flye\_module.sh is in the scripts directory and is made executable by `chmod +x ./scripts/03_run_flye_module.sh`. The script first loads the module on the HPC using `module load Flye/gcc-11.4.1/2.9.6`. After this line, all lines are almost exactly the same as in the task 6A conda script for making the output directory running flye, renaming files, and removing clutter. 

The script can be run with the command `./scripts/03_run_flye_module.sh`.

### Task 6C: local

The script 03\_run\_flye\_local.sh is in the scripts directory and is made executable by `chmod +x scripts/03_run_flye_local.sh`. The script makes the output directory, runs flye with the command `python ~/programs/Flye/bin/flye --nano-raw ./data/SRR33939694.fastq.gz --out-dir ./assemblies/assembly_local --threads 6`, and cleans up the files like the other versions of this script. I had to use python and the path name to the flye executable as I was unable to get flye to execute any other way for the local build.

The script can be run with the command `./scripts/03_run_flye_local.sh`.

### Task 7: Comparing log files

`cat ./assemblies/assembly_conda/conda_flye.log | tail -n 10` shows the last 10 lines of the log file. When I ran this command for each log file (changing the name to the appropriate file), the outputs were all the same.

### Task 8: Building pipeline.sh

I made the pipeline.sh script executable using `chmod +x pipeline.sh`, and the pipeline can be run from the assignment\_06 directory using `./pipeline.sh`.

The pipeline runs each script to download data, sets up the conda environment and local build, runs Flye three ways, and then prints the three outputs to the screen.

### Task 10: reflection

I faced a few challenges while doing this assignment. First, I could not get mamba to work for the flye environment. When I tried conda instead, the environment was made without any issues. While it could just be user error, I decided to cut my losses and use conda after spending a while trying to figure out why mamba wouldn’t work for me. Another challenge was figuring out how to call flye for the local build (and checking that it was built correctly). I ended up using the path to the flye executable in my programs directory when I wanted to run flye as this way didn’t give me any issues. The third challenge was making typos or forgetting the names of files, as sometimes I would mess up the script name in the pipeline and then have to wait for everything to run again. 

I learned how to set up a conda environment without using conda init/other bad internet instructions (yay!) and how to build locally. Knowing how to set up a conda environment without issues is very important to me since I had to set one up a few months ago and it was a nightmare on my Windows computer. I also learned the basics of Flye, and while I’m still not completely comfortable with genomic data/tools, it is neat to get to use this stuff.

For the different methods, I definitely thought the module was the easiest way and I would use modules first if they were an option. The local build was the biggest problem for me in this assignment, but I think that was user error in not calling the executable correctly (since I haven’t had problems with local builds any other time we’ve used them). The conda environment was also not bad, so I would potentially use it again as well.

