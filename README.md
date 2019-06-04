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

## Python

A simple Python example
 

## R

A simple R example
 
## Matlab

A simple Matlab example
 

## AMBER18 simulation  
This calculation simulates a 136475-atom biological molecule for 100,000 time steps (200 picoseconds).
It also demonstrates 
- the power parallelization using MPI
- the power of GPUs
- different between consumer-grade (NVidia Quadro P4000) and datacenter (NVIDIA Tesla V100) GPU 


## CM1 atmospheric simulation  
CM1 is an atmospheric physics simulation package. Learn more at the [developer's
site](http://www2.mmm.ucar.edu/people/bryan/cm1/).

> In scientific terms:  CM1 is a three-dimensional, non-hydrostatic, non-linear, time-dependent numerical model designed for idealized studies of atmospheric phenomena.

> In non-scientific terms: CM1 is a computer program used for atmospheric research. It is designed for studies of relatively small-scale processes in the Earth's atmosphere, such as thunderstorms. 

The included tests run two examples called 'squall_line' and 'supercell' provided along with the
CM1. 



