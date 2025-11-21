#!/usr/bin/env bash

echo Checking number of performance cores on this Mac...
declare -i npc=$(sysctl -n hw.perflevel0.physicalcpu)
echo Found $npc performance cores
echo Done!

echo Checking for fasta files...
if [ -f ! SRR4420293_1.fastq.gz ];
  then
  echo Downloading SRR4420293_1.fastq.gz since it does not exist
  curl ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR442/003/SRR4420293/SRR4420293_1.fastq.gz --output ./SRR4420293_1.fastq.gz
  echo Done!
fi

if [ -f ! SRR4420293_2.fastq.gz ];
  then
  echo Downloading SRR4420293_2.fastq.gz since it does not exists
  curl ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR442/003/SRR4420293/SRR4420293_2.fastq.gz --output ./SRR4420293_2.fastq.gz
  echo Done!
fi

if [ -f ! SRR4420296_1.fastq.gz ];
  then
  echo Downloading SRR4420296_1.fastq.gz since it does not exist
  curl ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR442/006/SRR4420296/SRR4420296_1.fastq.gz --output ./SRR4420296_1.fastq.gz
  echo Done!
fi

if [-f ! SRR4420296_2.fastq.gz ];
  then
  echo Downloading SRR4420296_2.fastq.gz since it does not exist
  curl ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR442/006/SRR4420296/SRR4420296_2.fastq.gz --output ./SRR4420296_2.fastq.gz
  echo Done!
fi
echo Done!

echo Checking for genome reference files...
echo Making the directory if it does not exist
mkdir -p Genome
if [ -f ! ./Genome/GCF_000001735.4_TAIR10.1_genomic.fna.gz ];
  then
  echo Downloading GCF_000001735.4_TAIR10.1_genomic.fna.gz since it does not exist...
  curl ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/735/GCF_000001735.4_TAIR10.1/GCF_000001735.4_TAIR10.1_genomic.fna.gz -o ./Genome/GCF_000001735.4_TAIR10.1_genomic.fna.gz
  echo Done!
fi
if [ -f ! ./Genome/GCF_000001735.4_TAIR10.1/GCF_000001735.4_TAIR10.1_genomic.gtf.gz ];
  then
  echo Downloading GCF_000001735.4_TAIR10.1_genomic.gtf.gz since it does not exist...
  curl ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/735/GCF_000001735.4_TAIR10.1/GCF_000001735.4_TAIR10.1_genomic.gtf.gz -o ./Genome/GCF_000001735.4_TAIR10.1/GCF_000001735.4_TAIR10.1_genomic.gtf.gz
  echo Done!
fi
echo Done!

echo Unzipping files...
tar -xzvf *gz
tar -xzvf ./Genome/*gz
echo Done!

echo Checking the files and generating fastqc reports...
nproc --all
mkdir -p fastqcReports
fastqc -t 4 -o ./fastqcReports/ ./*.gz
echo Done!

echo Compiling all the fastaqc results...
multiqc -p -o ./fastqcReports/ ./fastqcReports/ --title "Arabidopsis_RNAseq"
echo Done!

echo Trimming adaptor sequences...
mkdir -p adapter
echo Checking if the adaptor file exists
if [ -f ! ./adapter/TruSeq3-PE.fa ];
  then
  echo Downloading adapter file...
  wget https://github.com/usadellab/Trimmomatic/blob/main/adapters/TruSeq3-PE.fa -o ./adapter/TruSeq3-PE.fa
  echo Done!
fi
trimmomatic PE -threads $npc \
  SRR4420293_1.fastq.gz SRR4420293_2.fastq.gz \
  SRR4420293_1_trimmed_paired.fastq.gz \
  SRR4420293_1_trimmed_upaired.fastq.gz \
  SRR4420293_2_trimmed_paired.fastq.gz \
  SRR4420293_2_trimmed_unparied.fastq.gz \
  ILLUMINACLIP:adapter/TrueSeq3-PE.fa:2:30:10 \
  LEADING:3 TRAILING:3 SLIDINGWINDOW:4:5
echo Done!

echo Extracting splice sites and exons from the genome reference files...
hisat2_extract_splice_sites.py ./Genome/GCF_000001735.4_TAIR10.1_genomic.gtf>./Genome/splicesites.txt
hisat2_extract_exons.py ./Genome/GCF_000001735.4_TAIR10.1_genomic.gtf>./Genome/exons.txt
echo Done!

echo Building HISAT2 index from the splice site information...
mkdir -p ./Genome/hisat_index/
hisat2-build \
  -p $npc \
  --ss ./Genome/splicesites.txt \
  --exon ./Genome/exons.txt \
  ./Genome/GCF_000001735.4_TAIR10.1_genomic.fna \
  hisat_index/TAIR10
echo Done!

echo Aligning sequences with HISAT2..
hisat2 -p $npc \
  -x ./Genome/hisat_index/TAIR10 \
  -1 SRR4420293_1.fastq.gz \
  -2 SRR4420293_2.fastq.gz \
  -S ./aligned_reads/SRR4420293.sam \
  --summary-file ./aligned_reads/SRR4420293_alignment_summary.txt
echo Done!

echo Converting alignment to a sorted BAM
samtools view -@ $npc \
  -bS aligned_reads/SRR4420293.sam | \
  samtools sort -@ $npc -o aligned_reads/SRR4420293.sorted.bam \
  && samtools index aligned_reads/SRR4420293.sorted.bam
echo Done!

echo Counting features using subread...
mkdir -p gene_counts
featureCounts -a ./Genome/GCF_000001735.4_TAIR10.1_genomic.gtf \
  -o ./gene_counts/SRR4420293_counts.txt \
  -p \
  -t exon \
  -g gene_id \
  -T $npc \
  ./aligned_reads/SRR4420293.sorted.bam
echo Done!

echo Convert to csv file and showing the dataframe...
./txt2csv.py ./gene_counts/SRR4420293_counts.txt SRR4420293_counts.csv
echo Done!
