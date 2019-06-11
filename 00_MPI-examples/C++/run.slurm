#!/bin/bash
#SBATCH -p stdmemq          # Submit to 'stdmemq' Partitiion or queue
#SBATCH -J MPItest          # Name the job as 'MPItest'
#SBATCH -o MPItest-%j.out   # Write the standard output to file named 'jMPItest-<job_number>.out'
#SBATCH -e MPItest-%j.err   # Write the standard error to file named 'jMPItest-<job_number>.err'
#SBATCH -t 0-12:00:00        # Run for a maximum time of 0 days, 12 hours, 00 mins, 00 secs
#SBATCH --nodes=1            # Request N nodes
#SBATCH --ntasks-per-node=20 # Request n cores or task per node
#SBATCH --mem-per-cpu=4000   # Request 4000MB (4GB) RAM per core
#SBATCH --mail-type=ALL      # Send email notification at the start and end of the job
#SBATCH --mail-user=<user>@cofc.edu  # Send email notification to this address

module list                 # will list modules loaded by default. In our case, it will be GNU8 compilers and OpenMPI3 MPI libraries
module load openmpi3        # load OpenMPI3 if it isn't loaded already
module list                 # will list modules loaded; we'll just use this to check that the modules we selected are indeed loaded
pwd                         # prints current working directory
date                        # prints the date and time

# Compile the Fortran source into a binary executable file.
mpic++ -o hello_world hello_world.cpp

# and run
mpirun hello_world

