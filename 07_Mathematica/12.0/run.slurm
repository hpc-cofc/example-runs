#!/bin/bash
#SBATCH -p debugq                   # Submit to 'stdmemq' Partitiion or queue
#SBATCH -J jMathematica-test        # Name the job as 'jMathematica-test'
#SBATCH -o jMathematica-test-%j.out # Write the standard output to file named 'jjMathematica-test-<job_number>.out'
#SBATCH -e jMathematica-test-%j.err # Write the standard error to file named 'jjMathematica-test-<job_number>.err'
#SBATCH -t 0-2:00:00               # Run for a maximum time of 0 days, 2 hours, 00 mins, 00 secs
#SBATCH -N 1                        # Request N nodes
#SBATCH --ntasks-per-node=24         # Request n cores or task per node
#SBATCH --mem-per-cpu=4G            # Use as much as xGB memory per core

module list                   
pwd                         # prints current working directory
date                        # prints start date and time

module load math/mathematica/12.0
# examples from UChicago - https://rcc.uchicago.edu/docs/software/environments/mathematica/index.html
math -run < ./parallel.m  #examples from UChicago - https://rcc.uchicago.edu/docs/software/environments/mathematica/index.html

date                        # prints end date and time
