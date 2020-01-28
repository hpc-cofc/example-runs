#!/bin/bash
#SBATCH -p stdmemq                  # Submit to 'stdmemq' Partitiion or queue
#SBATCH -J jmothur-test             # Name the job as 'jmothur-test'
#SBATCH -o jmothur-test-%j.out      # Write the standard output to file named 'jmothur-test-<job_number>.out'
#SBATCH -e jmothur-test-%j.err      # Write the standard stderr to file named 'jmothur-test-<job_number>.err'
#SBATCH -t 0-24:00:00               # Run for a maximum time of 0 days, 2 hours, 00 mins, 00 secs
#SBATCH --ntasks=1                  # Request n cores or task per node
#SBATCH --mem-per-cpu=4G            # Use as much as xGB memory per core

module list                   
module load bio/mothur/1.43.0
module load bio/vsearch/2.14.2
module load bio/ncbi-blast+/2.10.0 
module list                   

pwd;ls               
echo "Calculation started `date`" 

#############################################
# Examples
# 

ln -s `which mothur` 
ln -s `which uchime` 
ln -s `which vsearch` 
ln -s `which blastx` 

mothur "./align.seqs/batch"

#############################################
echo "Calculation ended `date`" 
