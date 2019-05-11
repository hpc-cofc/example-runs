#!/bin/bash
#SBATCH -p debugq                # Submit to 'gpuq' Partitiion or queue
#SBATCH -J jdebugq-test          # Name the job as 'MPItest'
#SBATCH -o jdebugq-test-%j.out   # Write the standard output to file named 'jxxx-<job_number>.out'
#SBATCH -t 0-02:00:00               # Run for a maximum time of 0 days, 02 hours, 00 mins, 00 secs
#SBATCH --nodes=1                   # Request N nodes
#SBATCH --ntasks-per-node=24        # Request n cores or task per node
#SBATCH --mem-per-cpu=4GB           # Request 4GB RAM per core
#SBATCH --gres=gpu:v100:0           # Request 0/1 NVIDIA Tesla V100 GPU
#SBATCH --mail-type=ALL             # Send email notification at the start and end of the job
#SBATCH --mail-user=hpc@cofc.edu    # Send email notification to this address

module list                 # will list modules loaded by default.
pwd                         # prints current working directory
date                        # prints the date and time

# see the many SLURM environmental variables
env | grep -i slurm

# This calculation finds and counts prime numbers below 500,000 using 
# - Sieve of Eratosthenes method implemented by https://github.com/bbershadsky/GPU610 
# - and an MPI-parallelized brute-force method implemented by John Burkardt@FSU
#   https://people.sc.fsu.edu/~jburkardt/c_src/prime_mpi/prime_mpi.c
#
# In short, we test
# 1) Sieve of Eratosthenes - GPUs - CUDA Multithreading version 
# 2) Sieve of Eratosthenes - CPUs - simple CPU version 
# 3) Brute-force method - CPUs - MPI-parallelized version

if [ "$SLURM_JOB_PARTITION" == "gpuq" ] ; then 
   # If running on GPU nodes, run CUDA prime number finder
   # 1-2) Sieve of Eratosthenes - on GPU and CPU
   module swap gnu8 gnu7
   module load cuda/9.2
   nvcc -o prime_cuda code/prime_cuda.cu
   nvidia-modprobe 
   /usr/bin/time -f "Real Time: %E \tCPU Usage: %P" ./prime_cuda 500000 
   rm -f GenPrime_out*
 else
   # Otherwise run an MPI prime number finder on CPUs on 2, 4, 8, 16, ... etc ... cores 
   # 3) Brute-force method - CPUs - MPI-parallelized version
   module swap gnu7 gnu8
   mpicc -o prime_mpi code/prime_mpi.c 
   for ncores in 2 4 8 16 32 64 128 256 
    do
      echo "Number of MPI processes = $ncores"
      if [ "$ncores" -lt $SLURM_NTASKS ] ; then
         /usr/bin/time -f "Num Cores: $ncores \tReal Time: %E \tCPU Usage: %P" mpirun -np $ncores ./prime_mpi
       fi
    done
fi 

# Extract a summary
grep -i -e "Program Completed" -e REAL jdebugq-test-$SLURM_JOB_ID.out > summary-debugq.dat 
