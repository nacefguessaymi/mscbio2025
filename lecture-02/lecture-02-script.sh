#!/bin/env bash
(
# Go to the script directory
cd "$(dirname "$0")"

# Set up log
export LOG_FILE_PATH=./lecture-02.log
SAVE_DIR=./
echo "Starting setup on $(date)" > $LOG_FILE_PATH
exec &> $LOG_FILE_PATH

# Create example project tree and explore it
mkdir -p ./demo_project/data ./demo_project/results
echo "example" > ./demo_project/data/dummy.txt
cd ./demo_project
pwd
echo "--- contents ---"
ls -R
cd ..

# Set up lecture 2 data
mkdir -p ./course-filesystem-lab
cd ./course-filesystem-lab
mkdir -p ./data/ ./interim/ ./results/
curl http://mscbio2025-2025.github.io/files/Spellman.csv -o ./data/Spellman.csv
cp ./data/Spellman.csv ./interim/
echo "--- directory tree ---"
tree
)
