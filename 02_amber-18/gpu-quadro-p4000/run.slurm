#!/bin/bash
#SBATCH -p gpuq                # Submit to 'gpuq' Partitiion or queue
#SBATCH -J jgpuq-test          # Name the job as 'MPItest'
#SBATCH -o jgpuq-test-%j.out   # Write the standard output to file named 'jxxx-<job_number>.out'
#SBATCH -t 0-02:00:00               # Run for a maximum time of 0 days, 02 hours, 00 mins, 00 secs
#SBATCH --nodes=1                   # Request N nodes
#SBATCH --ntasks-per-node=24        # Request n cores or task per node
#SBATCH --mem-per-cpu=4GB           # Request 4GB RAM per core
#SBATCH --gres=gpu:v100:1           # Request 0/1 NVIDIA Tesla V100 GPU
#SBATCH --mail-type=ALL             # Send email notification at the start and end of the job
#SBATCH --mail-user=temelsob@cofc.edu    # Send email notification to this address

module list                 # will list modules loaded by default.
pwd                         # prints current working directory
date                        # prints the date and time

# see the many SLURM environmental variables
env | grep -i slurm

RUN=$SLURM_NTASKS
IN="initial.in"
OLD="initial.rst"
PRMTOP="standard.prmtop"
MPI="mpiexec"
EXE=pmemd.cuda

nvidia-modprobe   #-c 0 -u
nvidia-smi

module load chem/amber/18-gpu

`which $EXE` -O -i $IN -o $RUN.out -p $PRMTOP -c $OLD -r $RUN.rst -x $RUN.mdcrd -ref $OLD

