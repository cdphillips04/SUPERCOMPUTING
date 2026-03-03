## Caroline Phillips, 3/2/26, Supercomputing Assignment 5
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
