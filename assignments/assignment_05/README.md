## Caroline Phillips, 3/2/26, Supercomputing Assignment 5
### Task 1:

```
cd SUPERCOMPUTING
cd assignments_assignment_05
mkdir scripts
mkdir data data/raw data/trimmed
```

I also added the assignment 5 data folder to my .gitignore by opening vim and adding the line `assignments/assignment_05/data` to the file.

### Task 2:

I set up the script in the scripts folder and used wget to get the data file from online. To extract the contents, I used the tar command and just the -xf flags since the file was just a tar file and not gzipped. I moved all files ending in \*.fastq.gz in my raw data folder using `mv *.fastq.gz ../data/raw` and then removed the fastq\_examples.tar file.
