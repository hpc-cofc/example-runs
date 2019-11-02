#!/bin/bash
#SBATCH -p stdmemq               # Submit to 'stdmemq' Partitiion or queue
#SBATCH -J jbcftools-test             # Name the job as 'jbcftools-test'
#SBATCH -o jbcftools-test-%j.out      # Write the standard output to file named 'jbcftools-test-<job_number>.out'
#SBATCH -e jbcftools-test-%j.err      # Write the standard stderr to file named 'jbcftools-test-<job_number>.err'
#SBATCH -t 0-24:00:00            # Run for a maximum time of 0 days, 2 hours, 00 mins, 00 secs
#SBATCH --ntasks=1              # Request n cores or task per node
#SBATCH --mem=4G                # Use as much as xGB memory per core

module list                   
module load bio/bcftools/1.9 
module list                   

pwd;ls                         # prints current working directory
date                        # prints start date and time

# Example from https://www.arc.vt.edu/userguide/bcftools/ 
# 
bcftools call -c -v sim_variants.bcf > sim_variants.vcf

# other standard tests
cd /opt/ohpc/pub/src/bio/bcftools/test

perl ./test.pl

date                        # prints end date and time
