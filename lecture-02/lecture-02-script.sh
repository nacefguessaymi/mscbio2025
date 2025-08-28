#!/bin/env bash
(
# Go to the script directory
cd "$(dirname "$0")"

# Set up log
export LOG_FILE_PATH=./lecture-02.log
SAVE_DIR=./
echo "Starting setup on $(date)" > $LOG_FILE_PATH
exec &> $LOG_FILE_PATH

# Writing and running a jupyter notebook from the class
echo Running jupyter notebook. Contents are saved in the notebook.
pixi run jupyter nbconvert --execute ./lecture-02-notebook.ipynb --inplace

# Create example project tree and explore it
echo Making directories
mkdir -p ./demo_project/data ./demo_project/results

echo Making example text file.
echo "example" > ./demo_project/data/dummy.txt

echo Changing directory to the demo project.
cd ./demo_project

echo Printing absolute path of the current directory.
pwd

echo Showing the contents
echo "--- contents ---"
ls -R

echo Going back up to the parent directory
cd ..
pwd

# Set up lecture 2 data
echo Making the other directory
mkdir -p ./course-filesystem-lab

echo Changing into that directory
cd ./course-filesystem-lab
touch .gitkeep

echo Making the subdirectories
mkdir -p ./data/ ./interim/ ./results/
for d in ./*
  do
  touch $d/.gitkeep
done

echo Downloading the csv file
curl http://mscbio2025-2025.github.io/files/Spellman.csv -o ./data/Spellman.csv

echo Copying the file
cp ./data/Spellman.csv ./interim/

echo Showing the directory tree
echo "--- directory tree ---"
tree
)
