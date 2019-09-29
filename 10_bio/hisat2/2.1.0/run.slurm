#!/bin/bash
#SBATCH -p stdmemq               # Submit to 'stdmemq' Partitiion or queue
#SBATCH -J jhisat2-test             # Name the job as 'jhisat2-test'
#SBATCH -o jhisat2-test-%j.out      # Write the standard output/stderr to file named 'jhisat2-test-<job_number>.out'
#SBATCH -e jhisat2-test-%j.err      # Write the standard output/stderr to file named 'jhisat2-test-<job_number>.out'
#SBATCH -t 0-24:00:00            # Run for a maximum time of 0 days, 2 hours, 00 mins, 00 secs
#SBATCH --ntasks=8              # Request n cores or task per node
#SBATCH --mem=4G                # Use as much as xGB memory per core

module list                   
module load bio/hisat2/2.1.0 
module list                   

pwd;ls                         # prints current working directory
date                        # prints start date and time

# Example from https://hisat2.github.io/documentation.html 
# 

echo "step 1"
$HISAT2_HOME/hisat2-build $HISAT2_HOME/example/reference/22_20-21M.fa --snp $HISAT2_HOME/example/reference/22_20-21M.snp 22_20-21M_snp

echo "\n step 2"
$HISAT2_HOME/hisat2 -f -x $HISAT2_HOME/example/index/22_20-21M_snp -U $HISAT2_HOME/example/reads/reads_1.fa -S eg1.sam

echo "\n step 3"
$HISAT2_HOME/hisat2 -f -x $HISAT2_HOME/example/index/22_20-21M_snp -1 $HISAT2_HOME/example/reads/reads_1.fa -2 $HISAT2_HOME/example/reads/reads_2.fa -S eg2.sam

echo "\n step 4"
$HISAT2_HOME/hisat -f -x $HISAT2_HOME/example/index/22_20-21M_snp -1 $HISAT2_HOME/example/reads/reads_1.fa -2 $HISAT2_HOME/example/reads/reads_2.fa -S eg2.sam

module load bio/samtools

echo "\n step 5"
samtools view -bS eg2.sam > eg2.bam
samtools sort eg2.bam -o eg2.sorted.bam

echo "\n step 6"
#bcftools for later
#module load bio/bcftools
#samtools mpileup -uf $HISAT2_HOME/example/reference/22_20-21M.fa eg2.sorted.bam | bcftools view -bvcg - > eg2.raw.bcf
#bcftools view eg2.raw.bcf

date                        # prints end date and time
