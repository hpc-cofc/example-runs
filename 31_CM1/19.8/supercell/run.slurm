#!/bin/bash
#SBATCH -p debugq
#SBATCH -J jcm1-omp-test
#SBATCH -o jcm1-omp-test-%j
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=4000
#SBATCH --ntasks-per-node=4
#SBATCH --export=ALL
#SBATCH -t 00:30:00

set echo

umask 0027

module load cm1/19.8-omp
export OMP_NUM_THREADS=$SLURM_NTASKS
export MKL_NUM_THREADS=$SLURM_NTASKS

cm1.exe &> supercell.out
