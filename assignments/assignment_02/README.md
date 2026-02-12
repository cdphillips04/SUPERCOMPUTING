Caroline Phillips (cdphillips), 2/9/26, Supercomputing Assignment 2

In both the local and HPC repo, I have an assignment_02 folder with a data folder in it.

Task 1: Setting up the assignment folder

hpc:
cd SUPERCOMPUTING/assignments/assignment_02/

mkdir data

exit


Task 2: Downloading files via Command-Line FTP (except I have Windows, so WinSCP)

I had to use WinSCP to do task 2 since I have a Windows laptop. Since I just dragged the data into the SUPERCOMPUTING directory, I had to move my files using the commands

mv GCF_000005845.2_ASM584v2_genomic.fna.gz assignments/assignment_02/data 

mv GCF_000005845.2_ASM584v2_genomic.gff.gz assignments/assignment_02/data

to have these files in my data folder for this assignment.


Task 3.1: Transferring files to HPC

I used WinSCP again for file transfer from my local machine to the HPC. I navigated to /sciclone/home/cdphillips/SUPERCOMPUTING/assignments/assignment_02/data in the HPC and then dragged the files from my local assignment_02 data folder into the HPC data folder. 


Task 3.2: Using chmod to make files readable

Navigate to data folder with cd SUPERCOMPUTING/assignments/assignment_02/data/

Locally the files are readable for everyone, but on the HPC the files are only readable for the owner and group members (and not everyone else). To change this, I used 644 because I wanted to keep the files read/writeable for the owner (6) and readable for the group (4) as it originally was, and made the files readable for anyone else (4).

chmod 644 GCF_000005845.2_ASM584v2_genomic.fna.gz GCF_000005845.2_ASM584v2_genomic.gff.gz


Task 4: Checking file integrity with md5sum
HPC: 

md5sum GCF_000005845.2_ASM584v2_genomic.fna.gz returns 64297c59a8e1545feb64afb5ddc6b64c  GCF_000005845.2_ASM584v2_genomic.fna.gz

md5sum GCF_000005845.2_ASM584v2_genomic.gff.gz returns 53dda1db9791e3f5e2f9ccb5a3c6ca42  GCF_000005845.2_ASM584v2_genomic.gff.gz

Local:
md5sum GCF_000005845.2_ASM584v2_genomic.fna.gz returns 24ae85528f4a3ea02f9ba739ee458fc4 *GCF_000005845.2_ASM584v2_genomic.fna.gz

md5sum GCF_000005845.2_ASM584v2_genomic.gff.gz returns 17f3f3258ffe8b7bc433a99a96f9c599 *GCF_000005845.2_ASM584v2_genomic.gff.gz

The MD5 hashes from my local machine and the HPC do not match.


Task 5: Bash aliases

HPC:  Navigated back to home with cd.

vi ~/.bashrc

copy-pasted the 3 aliases and saved the file

source ~/.bashrc

The alias u goes to the parent directory of the current directory (cd ..), clears the screen, prints the current working directory (pwd), and lists (ls) the long format (l) of all files--including hidden ones (a)--with the size in a human-readable format (h) and with symbols to show the file type (F). The directories are listed first.

The alias d returns to the previous directory you were in, clears the screen, prints the current working directory, and lists (ls) the long format (l) of all files--including hidden ones (a)--with the size in a human-readable format (h) and with symbols to show the file type (F). The directories are listed first.

The alias ll lists (ls) the long format (l) of all files--including hidden ones (a)--with the size in a human-readable format (h) and with symbols to show the file type (F). The directories are listed first.

The last thing I did before pushing this assignment was make a .gitignore file for my SUPERCOMPUTING repo and add the data folder for this assignment because I did not want to push all this data to GitHub. I just used vim to make the file and added the path to the folder.

The hardest part of this assignment was troubleshooting task 2, the FTP file download. I made a change to my Windows firewall (which I got rid of after it didn’t work) and tried a few different passive commands, but none of it worked. After spending about an hour trying to find a solution, I learned the hard way that Windows is not cooperative. I found the rest of this assignment to be very straightforward. I did not have any more technology troubles.

