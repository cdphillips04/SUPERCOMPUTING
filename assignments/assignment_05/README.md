## Caroline Phillips, 3/2/26, Supercomputing Assignment 5

File locations: 
- 01\_download\_data.sh is in the assignment\_05 scripts folder
- The fastq files extracted for task 2 are in assignment\_05/data/raw
- The fastp tool is in my ~/programs directory on the HPC
- 02\_run\_fastp.sh is in assignment\_05/scripts
- The trimmed fastq files are in assignment\_05/data/trimmed
- Log files from running fastq are in assignment\_05/log

### Task 1:

```
cd SUPERCOMPUTING
cd assignments_assignment_05
mkdir scripts
mkdir data data/raw data/trimmed
```

I also added the assignment 5 data folder to my SUPERCOMPUTING .gitignore by using vim to open the file and adding the line `assignments/assignment_05/data` to the file.  

### Task 2:

I set up the script in the scripts folder and used wget to get the data file from online. To extract the contents, I used the tar command and just the -xf flags since the file was just a tar file and not gzipped. I moved all files ending in \*.fastq.gz in my raw data folder using `mv *.fastq.gz ../data/raw` and then removed the fastq\_examples.tar file.

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

I used the lines provided in the hint as the basis to write my 02\_run\_fastp.sh, but I still had to add lines to make sure my data files and log files ended up in the right folders. 

I first got the forward input file name by using $1, and then got the reverse name by switching R1 to R2 via pattern replacement. Then I used pattern replacement to change the file path from including data/raw to data/trimmed for the trimmed data because I wanted it in the trimmed folder.

To make the log file names, I changed the data/raw part of the forward input file name to log with pattern replacement. I used substring trimming to remove anything matching the pattern \_R[12]\*, which would leave me with a name like log/6083\_001\_S1. When I used the --json and --html parameters in the fastp command, I just tacked either .json or .html onto the log file name for the corresponding parameter.
