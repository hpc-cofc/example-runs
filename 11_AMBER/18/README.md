# AMBER 18

## Idea

This calculation simulates a 136475-atom biological molecule for 100,000 time
steps (0.2 nanoseconds). It also reports how long of a simulation we can run in a day
if we were to run it in
- one CPU-only node (`one-node`) with 40 cores = 40 MPI processes
- two CPU-only nodes (`two-nodes`) with 80 cores in total = 80 MPI processes
- one node with NVIDIA Quadro P4000 GPU (`gpu-quadro-p4000`) = 1 process on CPUs with massive processing on GPU
- one node with NVIDIA Tesla V100 GPU (`gpu-tesla-v100`) = 1 process on CPUs with massive processing on GPU

It demonstrates

- the power parallelization using MPI
   - compare calculations on a single node (smp) vs. multiple nodes (mpi)
- the power of GPUs
   - compare calculations on CPUs (smp, mpi) vs. GPUs (p4000, v100)
- different between consumer-grade and datacenter GPUs
   - compare consumer-grade (NVidia Quadro P4000) and datacenter (NVIDIA Tesla V100) GPU

## How to run

On the CofC HPC cluster, you can go into the `one-node`, `two-nodes`, `gpu-quadro-p4000` and
`gpu-tesla-v100` directories and enter `sbatch run.slurm`


## Results
Here is a summary from a sample run.

| Calculation             | Number of MPI processes | GPUs?  | Speed of simulation (ns/day) [higher is better] |
|:------------------------|:----------------|--------|:---------------------|
|./single-node/40.out:            |  40          | -      |    9.17 |
|./two-nodes/80.out:            |  80          | -      |    14.49 |
|./gpu-quadro-p4000/quadro.out:| 1       | 1      |    31.45 |
|./gpu-tesla-v100/24.out: |   1          | 1      |   116.84 |
