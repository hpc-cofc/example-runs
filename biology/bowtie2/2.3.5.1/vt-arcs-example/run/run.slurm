#!/bin/bash
#SBATCH -p stdmemq               # Submit to 'stdmemq' Partitiion or queue
#SBATCH -J jBOWTIE2             # Name the job as 'jBOWTIE2-test'
#SBATCH -o jBOWTIE2-%j.out      # Write the standard output to file named 'jBOWTIE2-test-<job_number>.out'
#SBATCH -e jBOWTIE2-%j.err      # Write the standard error to file named 'jBOWTIE2-test-<job_number>.err'
#SBATCH -t 0-24:00:00            # Run for a maximum time of 0 days, 2 hours, 00 mins, 00 secs
#SBATCH --ntasks=1              # Request n cores or task per node
#SBATCH --mem=4G                # Use as much as xGB memory per core

module list                   
module load bio/bowtie2/2.3.5.1
module list                   

pwd;ls                         # prints current working directory
date                        # prints start date and time
#
bowtie2 -x e_coli -U sim_reads.fq -S sim_reads_aligned.sam 
#
echo "Normal end of execution."
date
