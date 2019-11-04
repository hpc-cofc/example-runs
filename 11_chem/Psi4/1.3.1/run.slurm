#!/bin/bash
#SBATCH -p debugq                   # Submit to 'stdmemq' Partitiion or queue
#SBATCH -J jPsi-test                # Name the job as 'jPsi-test'
#SBATCH -o jPsi-test-%j.out         # Write the standard output to file named 'jjPsi-test-<job_number>.out'
#SBATCH -e jPsi-test-%j.err         # Write the standard error to file named 'jjPsi-test-<job_number>.err'
#SBATCH -t 0-2:00:00                # Run for a maximum time of 0 days, 2 hours, 00 mins, 00 secs
#SBATCH -N 1                        # Request N nodes
#SBATCH --ntasks-per-node=24        # Request n cores or task per node
#SBATCH --mem-per-cpu=4G            # Use as much as xGB memory per core

module list                   
pwd                         # prints current working directory
date                        # prints start date and time

module load chem/psi4conda/1.3.1 

psi4 -n $SLURM_NTASKS -i sapt2+3.in -o sapt2+3.out 

date                        # prints end date and time
