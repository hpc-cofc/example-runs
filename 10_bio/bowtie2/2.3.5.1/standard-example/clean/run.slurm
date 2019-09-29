#!/bin/bash
#SBATCH -p stdmemq               # Submit to 'stdmemq' Partitiion or queue
#SBATCH -J jBOWTIE2             # Name the job as 'jBOWTIE2-test'
#SBATCH -o jBOWTIE2-%j.out      # Write the standard output to file named 'jBOWTIE2-test-<job_number>.out'
#SBATCH -e jBOWTIE2-%j.err      # Write the standard error to file named 'jBOWTIE2-test-<job_number>.err'
#SBATCH -t 0-24:00:00            # Run for a maximum time of 0 days, 2 hours, 00 mins, 00 secs
#SBATCH --ntasks=4              # Request n cores or task per node
#SBATCH --mem=16G                # Use as much as xGB memory per core

module list                   
module load bio/bowtie2/2.3.5.1
module list                   

pwd;ls                         # prints current working directory
date                        # prints start date and time
#

# running in parallel using '-p $SLURM_NTASKS' option
echo "Aligning unpaired reads "
bowtie2 -p $SLURM_NTASKS -x ./example/index/lambda_virus -U ./example/reads/longreads.fq

echo "Aligning paired reads"
bowtie2 -p $SLURM_NTASKS -x ./example/index/lambda_virus -1 ./example/reads/reads_1.fq -2 ./example/reads/reads_2.fq

echo "Building a small index"
bowtie2-build ./example/reference/lambda_virus.fa ./example/index/lambda_virus

echo "Building a large index"
bowtie2-build --large-index ./example/reference/lambda_virus.fa ./example/index/lambda_virus

echo "Inspecting a lambda_virus index (small index) and outputting the summary"
bowtie2-inspect --summary ./example/index/lambda_virus

echo "Inspecting the entire lambda virus index (large index)" 
bowtie2-inspect --large-index ./example/index/lambda_virus

#
echo "Normal end of execution."
date
