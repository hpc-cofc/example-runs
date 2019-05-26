# Prime number finder 

## Idea
This calculation finds and counts the number of prime numbers below 500,000 using 
 - Sieve of Eratosthenes method implemented by [Boris Bershadsky](https://github.com/bbershadsky/GPU610) 
 - and an MPI-parallelized brute-force method implemented by [John Burkardt@FSU](https://people.sc.fsu.edu/~jburkardt/c_src/prime_mpi/prime_mpi.c)

## Tests
In short, we run
 1.  Sieve of Eratosthenes - GPUs - CUDA Multithreading version 
 2.  Sieve of Eratosthenes - CPUs - simple CPU version 
 3.  Brute-force method - CPUs - MPI-parallelized version

## How to run
You can use the `test-queue.sh` script to run the calculations on different queues/partitions on the CofC HPC cluster by
`./test-queue.sh`

## Results

Here is a summary from a sample run.

### Sieve of Eratosthenes - GPUs vs CPUs
See `summary-gpuq.dat`

| Calculation  | time (milliseconds) [lower is better] |
|:-------------|:----------------|
|GPU run       | 37  |
|CPU run       | 278 |

### Brute-force method - CPUs - MPI-parallelized version
See `summary-stdmemq.dat`

| Number of Cores or MPI processes  | Real time (seconds) [lower is better] | Parallel efficiency (higher is better)  |
|:------------------------|:----------------|:----------------------|
|2 	| 33 | 0.97 |
|4 	| 16 | 0.80	|
|8 	| 8  | 0.93 |
|16 	| 5  | 0.88 |

