#!/bin/bash
#SBATCH -p gpuq
#SBATCH -J jgpuq-test
#SBATCH -o jgpuq-test-%j
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=24
#SBATCH --export=ALL
#SBATCH -t 00:30:00

set echo

umask 0027
export GAUSS_SCRDIR=/globalscratch/$USER/$SLURM_JOB_ID
export SCRATCH=/globalscratch/$USER/$SLURM_JOB_ID

#export CONV_RSH=ssh
#module load namd/2.12-omp

#which namd2

nvidia-smi --loop=1 > gputil.log &
for PROC in 2 4 8 16 ; do
  ../namd2 +p$PROC +idlepoll apoa1.namd > $PROC.log
done

