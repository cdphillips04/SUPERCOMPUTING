## Caroline Phillips, 3/2/26, Supercomputing Assignment 5

File locations: 
- 01\_download\_data.sh is in the assignment\_05 scripts folder
- The fastq files extracted for task 2 are in assignment\_05/data/raw
- The fastp tool is in my ~/programs directory on the HPC
- 02\_run\_fastp.sh is in assignment\_05/scripts
- The trimmed fastq files are in assignment\_05/data/trimmed

### Task 1:

```
cd SUPERCOMPUTING
cd assignments/assignment_05
mkdir scripts
mkdir log
mkdir data data/raw data/trimmed
```

I also added the assignment 5 data folder to my SUPERCOMPUTING .gitignore by using vim to open the file and adding the line `assignments/assignment_05/data` to the file.  

### Task 2:

I set up the script in the scripts folder, had the script open data/raw/, and used wget to get the data file from online. To extract the contents, I used the tar command and just the -xf flags since the file was just a tar file and not gzipped. I removed the fastq\_examples.tar file.

### Task 3:

I first put myself in my programs directory with the command `cd ~/programs`.

I installed the pre-built binary of fastp using the following commands from the [fastp GitHub repository](https://github.com/OpenGene/fastp?tab=readme-ov-file#or-download-the-latest-prebuilt-binary-for-linux-users).

```
wget http://opengene.org/fastp/fastp
chmod a+x ./fastp
```

Because I didn't specify a version, I am using the latest build, which is version 1.1.0 (can discover which version you're using by running `fastp` and looking at the top of the output).

I made sure that the location of fastp (my programs directory) is in my ~./bashrc by adding the line `export PATH=$PATH:/sciclone/home/cdphillips/programs`.

### Task 4:

I used the lines provided in the hint as the basis to write my 02\_run\_fastp.sh, but I still had to add lines to make sure my data files ended up in the right folders. 

I first got the forward input file name by using $1, and then got the reverse name by switching R1 to R2 via pattern replacement. Then I used pattern replacement to change the file path from including data/raw to data/trimmed for the trimmed data because I wanted it in the trimmed folder.

I tested this script with `bash ./scripts/02_run_fastp.sh ./data/raw/6083_001_S1_R1_001.subset.fastq.gz` and confirmed that all files were in the correct locations.

### Task 5:

In pipeline.sh, I made sure both of the other scripts were executable using chmod. Then I wrote a for loop for all files containing R1 in the raw data folder that would run the fastp script for each file. This pipeline is ran from the assignment\_05 directory, so I made sure that the file paths in my scripts were correct for this. I also made this script executable using `chmod +x pipeline.sh`.

### About the pipeline:

To run the pipeline, use the command `./pipeline`. Users should have a data directory that holds a raw directory and a trimmed directory so the raw and trimmed data can be put in the respective folders. Users will also need to have fastp installed.

This pipeline downloads and extracts data from [this link](https://gzahn.github.io/data/fastq_examples.tar), places it in the raw data folder, and trims the data by removing the first 8 bases and last 20 bases from forward and reverse files and discards certain reads based on a few criteria (reads with "N", shorter than 100nt, and <20 average quality).

### Reflection:

The biggest challenge in this assignment was making sure my data went into the right folders. Once I changed the path from containing raw to trimmed in script 2, I didn't have any issues with that. It was helpful to get more practice with pattern replacement as well.

I learned how to make my pipeline run several scripts and get it all to work without issues, which is pretty neat. I messed up on my first attempt of the pipeline.sh for loop, so I figured out I need to include the slash after the folder to access (ex. data/raw/\* instead of data/raw). I also learned about parameter options for fastp and how to use fastp with paired data like in task 4. I have never used tools like this and honestly didn't realize you could just download stuff like this from random people on the internet, so I definitely want to keep an eye out for other useful tools that are out there.

Writing multiple scripts that each have one purpose, and then using a pipeline to call them, makes it easy for anyone to reproduce the results we've gotten and have everything done for them instead of having to get the data themselves and run individual scripts. If there are any issues in commands or logic, it is much easier to debug and modify one script without having to change other scripts in the pipeline. Finally, these scripts can be used in other pipelines without rewriting code, which saves time and prevents long files or clutter in directories.

If one didn't use separate scripts and a pipeline, it would be much harder to find bugs in a large file since the multiple functionalities of the large file aren't isolated. It would also be harder for anyone else to reproduce the results we've obtained since it's up to them to get the data correctly and run scripts in the correct order. Having more steps means there's more chances someone will mess something up, so a pipeline can reduce the risk of mistakes.
