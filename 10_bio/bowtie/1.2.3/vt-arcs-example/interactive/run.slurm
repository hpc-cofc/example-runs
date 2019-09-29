#!/bin/bash
#SBATCH -p stdmemq               # Submit to 'stdmemq' Partitiion or queue
#SBATCH -J jBOWTIE             # Name the job as 'jBOWTIE-test'
#SBATCH -o jBOWTIE-%j.out      # Write the standard output to file named 'jBOWTIE-test-<job_number>.out'
#SBATCH -e jBOWTIE-%j.err      # Write the standard error to file named 'jBOWTIE-test-<job_number>.err'
#SBATCH -t 0-24:00:00            # Run for a maximum time of 0 days, 2 hours, 00 mins, 00 secs
#SBATCH --ntasks=1              # Request n cores or task per node
#SBATCH --mem=4G                # Use as much as xGB memory per core

module list                   
module load bio/bowtie/1.2.3 
module list                   

pwd;ls                         # prints current working directory
date                        # prints start date and time
#
bowtie -t e_coli e_coli_1000.fq e_coli.map &> bowtie_newriver.txt
#
echo "Normal end of execution."
date
