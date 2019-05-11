#!/bin/bash
#SBATCH -p stdmemq
#SBATCH -J jstdmemq-test
#SBATCH -o jstdmemq-test-%j
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=40
#SBATCH --export=ALL
#SBATCH -t 02:00:00

set echo
date
hostname
umask 0027

RUN=$SLURM_NTASKS
IN="initial.in"
OLD="initial.rst"
PRMTOP="standard.prmtop"
MPI="mpiexec"
EXE=pmemd.MPI

module load chem/amber/18-cpu

mpiexec -np $SLURM_NTASKS `which pmemd.MPI` -O -i $IN -o $RUN.out -p $PRMTOP -c $OLD -r $RUN.rst -x $RUN.mdcrd -ref $OLD

