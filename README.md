# Example-runs
Sample runs and benchmarks

The sample calculations here are intended to guide you in setting up and running your own
calculations. Each directory provides all the input files and batch submission files needed to run
the particular calculations.

## Prime number finder
This example demonstrates the power of 
- parallelization using MPI
- picking the right algorithms
- GPUs

## AMBER18 simulation  
This calculation simulates a 136475-atom biological molecule for 100,000 time steps (200 picoseconds).
It also demonstrates 
- the power parallelization using MPI
- the power of GPUs
- different between consumer-grade (NVidia Quadro P4000) and datacenter (NVIDIA Tesla V100) GPU 
