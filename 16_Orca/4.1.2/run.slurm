#!/bin/bash
#SBATCH -p debugq                   # Submit to 'stdmemq' Partitiion or queue
#SBATCH -J jorca-test               # Name the job as 'jorca-test'
#SBATCH -o jorca-test-%j.out        # Write the standard output to file named 'jjorca-test-<job_number>.out'
#SBATCH -e jorca-test-%j.err        # Write the standard error to file named 'jjorca-test-<job_number>.err'
#SBATCH -t 0-2:00:00                # Run for a maximum time of 0 days, 2 hours, 00 mins, 00 secs
#SBATCH -N 1                        # Request N nodes
#SBATCH --ntasks-per-node=16        # Request n cores or task per node
#SBATCH --mem-per-cpu=4G            # Use as much as xGB memory per core

module list                   
pwd                         # prints current working directory
date                        # prints start date and time

module load chem/orca/4.1.2

# calculates the MP2-F12/VTZ-F12 energy of water dimer
runorca.sh -i water-dimer-mp2f12.inp

date                        # prints end date and time
