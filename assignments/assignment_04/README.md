Caroline Phillips (cdphillips), 2/25/26, Supercomputing Assignment 4

File locations: install_gh.sh (task 3) and install_seqtk.sh (task 6) are in my programs directory on the HPC. summarize_fasta.sh (task 8) is in my assignment_04 directory.

Tasks 1 and 2: I already have the programs directory and installed gh prior to this assignment.

Task 3: From home, `cd programs`. In programs, I created the install_gh.sh file with vim and used the wget, tar, and rm commands like how we’ve done in class before.

Task 4: Since install_gh.sh is in my programs directory, the location can be added to my $PATH by opening my ~/.bashrc with vim (vi ~/.bashrc) and then pasting the following line: `export PATH=$PATH:/sciclone/home/cdphillips/programs`. I made install_gh.sh executable with `chmod +x install_gh.sh` in case anyone actually wanted to use it.

Task 5: I already have this set up on the HPC from class.

Task 6: I made the install_seqtk.sh file using vim with the standard first two lines. This file is also in the programs directory. In the script, I did cd programs and used the two installation lines from the seqtk repo. To add the directory that seqtk lives in (the seqtk directory because that’s where the executable seqtk file is) to my ~/.bashrc, I used `echo "export PATH=$PATH:$(pwd)" >> ~/.bashrc`. Outside of vim, I also made the file executable with `chmod +x install_seqtk.sh` so I could run the script. I finally ran `exec bash`.

Task 7: seqtk can convert file types, apply masks, and extract sequences in certain regions in a file or with certain names in a file. I also tried the comp command on the assignment 3 data file, which gave me the nucleotide composition (including sequence name, length, and more counts).

Task 8: 

To get into my assignment 4 directory, I did `cd SUPERCOMPUTING/assignments/assignment_04` and used vim to edit summarize_fasta.sh.

I got the file name and saved it to a parameter using file_name=$1. I echoed this to stdout so it’s easy to see which file is being used. To count the total number of sequences, I used these commands: `seqtk comp ${file_name} | wc -l`. comp shows the composition of the file (with one line per sequence), so I could pipe that to wc to count how many sequences there were.

To calculate the number of nucleotides, I used these commands: `grep -v "^>" ${file_name} | tr -d "\n" | wc -c)`. grep finds lines not starting with “>” (so it excludes header lines), then tr gets rid of new line characters, and wc counts the number of characters.

To get a table of sequence names and lengths, I used this command with echo: `$(seqtk comp ${file_name} | cut -f1,2)`. The first column returned by comp is the sequence name, and the second column is the sequence length. I piped the output to cut and specified just the first two columns, which results in a tab separated table of just names and lengths.

Finally, I added `export PATH=$PATH:/sciclone/home/cdphillips/SUPERCOMPUTING/assignments/assignment_04` to my ~/.bashrc.

Task 9:
Within the data folder for assignment 4 (`mkdir data`, `cd data`), I made two copies of the data from assignment 3 to use for this part: 

`cp GCF_000001735.4_TAIR10.1_genomic.fna GCF_copy_1.fna`
 
`cp GCF_000001735.4_TAIR10.1_genomic.fna GCF_copy_2.fna`

`for file in \*.fna;do summarize_fasta.sh "$file";done`

This for loop showed the output for all files ending in .fna one after the other.

Task 10:

I don’t think I had any big challenges with this assignment. I learned a few features that seqtk offers, including counts from the comp command that we could also get using grep. I thought this assignment was good to reinforce the for loop syntax and how to use it with files. I also thought it was helpful to practice making scripts with bash commands, especially with getting the formatting down for command substitutions and accessing variables within these scripts. I’m excited to see more of what seqtk can do. $PATH is the directories looked at when commands are run, so it’s good to add directories there so you don’t have to use the full path to that directory. When I did this assignment, I made sure my assignment_04 directory was added and also added the seqtk directory in task 6.

