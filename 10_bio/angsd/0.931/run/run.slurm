#!/bin/bash
#SBATCH -p stdmemq               # Submit to 'stdmemq' Partitiion or queue
#SBATCH -J jangsd-test             # Name the job as 'jangsd-test'
#SBATCH -o jangsd-test-%j.out      # Write the standard output to file named 'jangsd-test-<job_number>.out'
#SBATCH -e jangsd-test-%j.err      # Write the standard stderr to file named 'jangsd-test-<job_number>.err'
#SBATCH -t 0-24:00:00            # Run for a maximum time of 0 days, 2 hours, 00 mins, 00 secs
#SBATCH --ntasks=1              # Request n cores or task per node
#SBATCH --mem=4G                # Use as much as xGB memory per core

module list                   
module load bio/angsd/0.931
module list                   

pwd;ls                         # prints current working directory
date                        # prints start date and time

# Examples
# 

angsd -doMaf 4 -beagle assotest/test.beagle -fai hg19.fa.fai -yBin assotest/test.phe -doAsso 6 -out tmp -minCount 0 -minHigh 0 -seed 123

date                        # prints end date and time
