#/bin/env bash
(
# Go to the script directory
cd "$(dirname "$0")"

# Setting up log
export LOG_FILE_PATH=./lecture-03.log
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
echo Some simple text manipulation.
echo "a\nb\na\nb\nb" > $SAVE_DIR/test.txt
cat $SAVE_DIR/test.txt
echo Sorted
cat $SAVE_DIR/test.txt | sort
echo Number of unique letters
cat $SAVE_DIR/test.txt | sort | uniq
echo Number of unique letters with their counts
cat $SAVE_DIR/test.txt | sort | uniq | wc

# Class activity
echo Downloading activity excel
curl https://mscbio2025-2025.github.io/files/Spellman.csv -o $SAVE_DIR/Spellman.csv
# Number of datapoints in the csv
grep Y. | wc -l
# Gives the number of genes in chromosome A
echo Number of ORFs in chromosome A
grep YA. $SAVE_DIR/Spellman.csv | wc -l
# Gives number of genes in each chromosome
echo Number of ORFs in each chromosome
grep Y. $SAVE_DIR/Spellman.csv | cut -c 2 | sort | uniq -c | sort
# Number of genes in each chromosome arm
echo Number of ORFs in each chromosome arm
grep Y. $SAVE_DIR/Spellman.csv | cut -c 7 | sort | uniq -c | sort
# Number of points with a positive value
echo Number of points with a positive value
awk -F, '{if ($2>0) {print $2}}' $SAVE_DIR/Spellman.csv | wc -l
# Highest initial expression values 
echo Points with the highest expression values
awk -F, '{print $2}' $SAVE_DIR/Spellman.csv | sort -hr | head -n 10

)
