#!/bin/bash
#SBATCH -p stdmemq               # Submit to 'stdmemq' Partitiion or queue
#SBATCH -J jbedtools-test             # Name the job as 'jbedtools-test'
#SBATCH -o jbedtools-test-%j.out      # Write the standard output to file named 'jbedtools-test-<job_number>.out'
#SBATCH -e jbedtools-test-%j.err      # Write the standard stderr to file named 'jbedtools-test-<job_number>.err'
#SBATCH -t 0-24:00:00            # Run for a maximum time of 0 days, 2 hours, 00 mins, 00 secs
#SBATCH --ntasks=1              # Request n cores or task per node
#SBATCH --mem=4G                # Use as much as xGB memory per core

module list                   
module load bio/bedtools/2.29.0 
module list                   

pwd;ls                         # prints current working directory
date                        # prints start date and time

# Example from https://bedtools.readthedocs.io/en/latest/ 
# 
bedtools intersect -a input.bed -b input-short.bed -f 0.50 -r
bedtools closest -a input.bed -b input-short.bed -io

date                        # prints end date and time
