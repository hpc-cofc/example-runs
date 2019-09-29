#!/bin/bash
#SBATCH -p stdmemq               # Submit to 'stdmemq' Partitiion or queue
#SBATCH -J jBWA-test             # Name the job as 'jPsi-test'
#SBATCH -o jBWA-test-%j.out      # Write the standard output/error to file named 'jBWA-test-<job_number>.out'
#SBATCH -t 0-24:00:00            # Run for a maximum time of 0 days, 2 hours, 00 mins, 00 secs
#SBATCH --ntasks=1              # Request n cores or task per node
#SBATCH --mem=4G                # Use as much as xGB memory per core

module list                   
module load bio/bwa/0.7.17 
module list                   

pwd;ls                         # prints current working directory
date                        # prints start date and time

#
#  Index the reference genome.
#
gunzip dmel-all-chromosome-r5.37.fasta.gz
bwa index dmel-all-chromosome-r5.37.fasta
if [ $? -ne 0 ]; then
  echo "BWA_NEWRIVER: Run error!"
  exit 1
fi
#
#  Align the reads against the reference.
#
bwa aln -I -t 8 dmel-all-chromosome-r5.37.fasta read.fasta > out.sai
if [ $? -ne 0 ]; then
  echo "BWA_NEWRIVER: Run error!"
  exit 1
fi
#
#  Convert the alignment into a SAM file.
#
bwa samse dmel-all-chromosome-r5.37.fasta out.sai read.fasta > out.sam
if [ $? -ne 0 ]; then
  echo "BWA_NEWRIVER: Run error!"
  exit 1
fi
#
echo "BWA_NEWRIVER: Normal end of execution."

ls
date                        # prints end date and time
exit 0
