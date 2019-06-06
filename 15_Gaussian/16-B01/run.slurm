#!/bin/bash
#SBATCH -p bigmemq
#SBATCH -J jbigmem-test
#SBATCH -o jbigmem-test-%j
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --export=ALL
#SBATCH -t 00:30:00

set echo

umask 0027
echo $SLURM_SUBMIT_DIR
module list 
module load chem/gaussian
module list 

echo $PATH
which g16 

export GAUSS_SCRDIR=/scratch/$USER

g16 < input.com > output.log
