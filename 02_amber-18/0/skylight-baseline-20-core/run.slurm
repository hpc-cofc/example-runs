#!/bin/tcsh
#SBATCH -p stdmem
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --mem=48G
#SBATCH --export=ALL
#SBATCH -t 48:00:00
#SBATCH -J jtest-1
#SBATCH -o jtest-1.o%j

source /usr/share/Modules/init/tcsh

set echo
echo " "
hostname

set NUM=0
set RUN="part$NUM"
set IN="initial9.in"
set OLD="initial.rst"
set PRMTOP="standard.prmtop"
set MPI="mpiexec"
set EXE=pmemd.MPI
date

module load amber/16
#mpiexec -np $SLURM_NTASKS `which pmemd.MPI` -O -i mdin -o 16-mdout -p prmtop -c inpcrd -x crd.16
mpiexec -np $SLURM_NTASKS `which pmemd.MPI` -O -i $IN -o $RUN.out -p $PRMTOP -c $OLD -r $RUN.rst -x $RUN.mdcrd -ref $OLD

