#!/bin/bash
#SBATCH -p debugq     
#SBATCH -J jGMStest     
#SBATCH -o jGMStest-%j.out
#SBATCH -e jGMStest-%j.err
#SBATCH -t 0-02:00:00 
#SBATCH -N 1         
#SBATCH -n 24        
#SBATCH --mem=180G   

module list                   
pwd                         # prints current working directory
date                        # prints the date and time

module load chem/gamess
export NCPUS=$SLURM_NTASKS
rungms test.inp 00 $NCPUS > test.out

rm -rf /scratch/$USER/test*

