Task 1:
log in with bora command and password
cd SUPERCOMPUTING/assignments/assignment_03
mkdir data

Task 2:
cd data
wget https://gzahn.github.io/data/GCF_000001735.4_TAIR10.1_genomic.fna.gz
gunzip GCF_000001735.4_TAIR10.1_genomic.fna.gz

Task 3:
1. grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna | wc -l 
(or grep -c ">" GCF_000001735.4_TAIR10.1_genomic.fna also works)

2. grep -v "^>" GCF_000001735.4_TAIR10.1_genomic.fna | tr -d "\n" | wc -c

used tr --help when getting error "tr: when not truncating set1, string2 must be non-empty" when I didn't use -d but instead tried to replace "\n" with ""


3. wc -l GCF_000001735.4_TAIR10.1_genomic.fna

4. grep ">" GCF_000001735.4_TAIR10.1_genomic.fna | grep "mitochondrion" GCF_000001735.4_TAIR10.1_genomic.fna | wc -l

5. grep ">" GCF_000001735.4_TAIR10.1_genomic.fna | grep "chromosome" GCF_000001735.4_TAIR10.1_genomic.fna |
 wc -l

6. 

7. head -n 10 GCF_000001735.4_TAIR10.1_genomic.fna | tail -n 1 | grep -i "[A,G,C,T,U]" | wc -c

8. grep "AAAAAAAAAAAAAAAA" GCF_000001735.4_TAIR10.1_genomic.fna | wc -l

9. grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna | sort | head -n 1

10. paste <(grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna) <(grep -v "^>" GCF_000001735.4_TAIR10.1_genomic.fna)
