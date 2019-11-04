#!/bin/bash
#SBATCH -p stdmemq                   # Submit to 'stdmemq' Partitiion or queue
#SBATCH -J jSamtools-test                # Name the job as 'jPsi-test'
#SBATCH -o jSamtools-test-%j.out         # Write the standard output to file named 'jjPsi-test-<job_number>.out'
#SBATCH -e jSamtools-test-%j.err         # Write the standard error to file named 'jjPsi-test-<job_number>.err'
#SBATCH -t 0-24:00:00                # Run for a maximum time of 0 days, 2 hours, 00 mins, 00 secs
#SBATCH --ntasks=1        # Request n cores or task per node
#SBATCH --mem=5G            # Use as much as xGB memory per core

module list                   
module load bio/samtools/1.9
module list                   

pwd;ls                # prints current working directory and list contents
date                        # prints start date and time

# The following calculation converts a SAM file to BAM format:
#  Convert a SAM file to BAM format.
#  * -b indicates the output should be in BAM format;
#  * -S indicates the input is in SAM format;
#  * -o names the output file.
#
samtools view -b -S -o sim_reads_aligned.bam sim_reads_aligned.sam
#
echo "Normal end of execution."
ls                          # print contents of working directory
date                        # prints end date and time
