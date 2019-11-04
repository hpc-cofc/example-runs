#!/bin/bash
#SBATCH -p stdmemq
#SBATCH -J jstdmemq-test
#SBATCH -o jstdmemq-test-%j
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=40
#SBATCH --export=ALL
#SBATCH -t 00:30:00

set echo

umask 0027
export GAUSS_SCRDIR=/globalscratch/$USER/$SLURM_JOB_ID
export SCRATCH=/globalscratch/$USER/$SLURM_JOB_ID
export PATH=/home/bt-local/src/NAMD/NAMD_2.13_Linux-x86_64-ibverbs:$PATH

#export CONV_RSH=ssh
#module load namd/2.12-omp

which namd2

#for PROC in 2 4 8 16 32; do
#  ../../charmrun +p$PROC ../../namd2 apoa1.namd > $PROC.log
#done

for PROC in 40 80; do
  charmrun +p$PROC ++mpiexec `which namd2` apoa1.namd > $PROC.log
done

