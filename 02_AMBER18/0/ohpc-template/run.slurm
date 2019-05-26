#!/bin/bash
#SBATCH -p stdmemq
#SBATCH -J jstdmemq-test
#SBATCH -o jstdmemq-test-%j
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --export=ALL
#SBATCH -t 02:00:00

set echo
date
hostname
umask 0027
export GAUSS_SCRDIR=/globalscratch/$USER/$SLURM_JOB_ID
export SCRATCH=/globalscratch/$USER/$SLURM_JOB_ID

RUN=$SLURM_NTASKS
IN="initial.in"
OLD="initial.rst"
PRMTOP="standard.prmtop"
MPI="mpiexec"
EXE=pmemd.MPI

source /home/bt-local/src/amber18/amber.sh
mpiexec -np $SLURM_NTASKS `which pmemd.MPI` -O -i $IN -o $RUN.out -p $PRMTOP -c $OLD -r $RUN.rst -x $RUN.mdcrd -ref $OLD

