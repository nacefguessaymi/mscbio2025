#!/bin/env bash
(
# Go to the script directory
cd "$(dirname "$0")"

# Setting up log
export LOG_FILE_PATH=./lecture-02.log
SAVE_DIR=./
echo "Starting setup on $(date)" > $LOG_FILE_PATH
exec &> $LOG_FILE_PATH

# Example of using environmental variable
X=3
echo $X

# Example setting command as a variable
unset X
X=`ls *csv`
echo $X

# Example of a for loop with nested if statement
for i in {1..10}
do
  if [ $i -gt 5 ]; then
    echo $
  fi
done

# Example usage of cat
echo Hello > $SAVE_DIR/h.txt
echo World >> $SAVE_DIR/h.txt
cat h.txt

# Text manipulation example
echo "a\nb\na\nb\nb" > $SAVE_DIR/test.txt
cat $SAVE_DIR/test.txt
cat $SAVE_DIR/test.txt | sort
cat $SAVE_DIR/test.txt | sort | uniq
cat $SAVE_DIR/test.txt | sort | uniq | wc

# Class activity
curl https://mscbio2025-2025.github.io/files/Spellman.csv -o $SAVE_DIR/Spellman.csv
# Gives the number of genes in chromosome A
grep YA. $SAVE_DIR/Spellman.csv | wc -l
# Gives number of genes in each chromosome
grep Y. $SAVE_DIR/Spellman.csv | cut -c 2 | uniq -c
# Number of genes in each chromosome arm
grep Y. $SAVE_DIR/Spellman.csv | cut -c 7 | uniq -c


)
