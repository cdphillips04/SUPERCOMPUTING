mkdir assignments

cd assignments

mkdir assignment_1

cd assignment_1

mkdir data

cd data

mkdir raw

mkdir clean

cd raw

touch raw_data.csv

cd ..

cd clean

touch clean_data.csv

cd ..

cd ..

mkdir scripts

cd scripts

touch file_format_script.sh

cd ..

mkdir results

cd results

touch results_test1_1-2026.txt

cd ..

mkdir docs

cd docs

touch test_docs_1-2026.txt

touch test_docs_12-2025.txt

cd ..

mkdir config

cd config

touch config_file.json

cd ..

mkdir logs

cd logs

touch project_log.log

cd ..

I decided to go subdirectory by subdirectory when making this project structure, and create a placeholder file in a subdirectory before moving on to make more subdirectories. I stuck to mkdir for making new directories, cd to move around, and touch to make blank placeholder files. I used vim to write this README since that's what I like, but I also considered appending lines to the file using echo "text here" >> README.md. I also used vim for the essay file as well.
