Caroline Phillips (cdphillips), 2/18/26, Supercomputing Assignment 3

This README is in the assignment_03 folder in the SUPERCOMPUTING/assignments directory, and there is a data folder in the assignment_03 folder. 

Task 1: Navigating to assignment_03 directory

log in with bora command and password

cd SUPERCOMPUTING/assignments/assignment_03

mkdir data

Task 2: Downloading the fasta sequence

cd data

wget https://gzahn.github.io/data/GCF_000001735.4_TAIR10.1_genomic.fna.gz

gunzip GCF_000001735.4_TAIR10.1_genomic.fna.gz

Task 3: Using Unix tools (run these commands from the data directory)

1. grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna | wc -l 

(or grep -c ">" GCF_000001735.4_TAIR10.1_genomic.fna also works)

2. grep -v "^>" GCF_000001735.4_TAIR10.1_genomic.fna | tr -d "\n" | wc -c

used tr --help when getting error "tr: when not truncating set1, string2 must be non-empty" when I didn't use -d but instead tried to replace "\n" with ""


3. wc -l GCF_000001735.4_TAIR10.1_genomic.fna

4. grep ">" GCF_000001735.4_TAIR10.1_genomic.fna | grep "mitochondrion" GCF_000001735.4_TAIR10.1_genomic.fna | wc -l

5. grep ">" GCF_000001735.4_TAIR10.1_genomic.fna | grep "chromosome" GCF_000001735.4_TAIR10.1_genomic.fna |
 wc -l

6. paste <(grep -v "^>" GCF_000001735.4_TAIR10.1_genomic.fna | head -n 1 | wc -c) <(grep -v "^>" GCF_000001735.4_TAIR10.1_genomic.fna | head -n 2 | tail -n 1 | wc -c) <(grep -v "^>" GCF_000001735.4_TAIR10.1_genomic.fna | head -n 3 | tail -n 1 | wc -c) 

7. head -n 10 GCF_000001735.4_TAIR10.1_genomic.fna | tail -n 1 | grep -i "[A,G,C,T,U]" | wc -c

8. grep "AAAAAAAAAAAAAAAA" GCF_000001735.4_TAIR10.1_genomic.fna | wc -l

9. grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna | sort | head -n 1

10. paste <(grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna) <(grep -v "^>" GCF_000001735.4_TAIR10.1_genomic.fna)

Reflection:

I decided to review what I had learned before starting the assignment so everything would be fresh in my mind. For each question, I thought about possible commands to use before trying them and ruled out any that wouldn’t be useful for the question. I found it helpful to read man pages and/or the help output for commands when I wanted to learn more about the available flags. This was especially helpful for question 2 when I used the tr command with the -d flag to remove newlines and replace them with an empty string. Apparently the second string that the command takes can’t be empty, so -d is a way around that. I think this assignment made me more comfortable with using grep. In the past I’ve learned about grep, but not had any reason to use it, so this assignment was great practice for all the things grep can do. I also put the assignment 3 data folder in the .gitignore so the large data file doesn’t go to my GitHub page.

I thought question 6 was the trickiest of the questions, but I was also working on the assignment late at night so that likely made it harder for me than it needed to be. Figuring out how to use paste with grep, head, and tail got a little frustrating since I got the order of process substitutions wrong a few times. I was surprised to have used grep in almost every command.

These skills are essential in computational work because data is huge, and there is no way to manually go through all of it to look for certain patterns or replace characters with others. From the few times I accidentally didn’t pipe to wc -c and then got an endless stream of letters on my screen, it’s easy to see why no one could manipulate files manually; you need strong tools to do this type of work.



