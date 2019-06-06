# Matlab 2019a/2018b/2018a/2017b

Matlab is a general numerical simulation package that is known both for its powerful features and efficiency.

While most people use Matlab in interactive mode running on one CPU core, it does have capabilies to run on HPCs using a batch queue manager.
We encourage users to do some testing on the login node and do their production runs by submitting
them to compute nodes via the batch scheduler.


## What versions of Matlab are available?

You can always execute `module spider matlab` to see what versions of Matlab are available. In our
case, you should see something like this:

```
user@localhost>  module spider matlab

----------------------------------------------------------------------
  math/matlab:
----------------------------------------------------------------------
    Description:
      Application for computational chemistry and biochemistry

     Versions:
        math/matlab/r2017b
        math/matlab/r2018a
        math/matlab/r2018b
        math/matlab/r2019a

------------------------------------------------------------------------
  For detailed information about a specific "math/matlab" module (including how to load the modules) use the module's full name.
  For example:

     $ module spider math/matlab/r2019a
------------------------------------------------------------------------
```

# Operation Modes
## Interactive mode on login node
#
To
This particular installation includes OpenMP parallelism within a compute node. It is compiled with
our Intel compiler and library toolchain. It also leverages netCDF data formats. 

### Interactive mode on compute nodes


### Batch mode on compute nodes


## How to run

There are very good instructions on adapting Matlab to run optimally on an HPC syste:
(here)[https://github.com/UtrechtUniversity/MATLAB-on-HPC/blob/master/Part-3-Parallel-Matlab.md]
#
The necessary modules are loaded automatically when you load the `cm1` module.

The number of OpenMP threads should be set to equal the number of cores requested for the calculation.

```
module load cm1/19.8-omp
export OMP_NUM_THREADS=$SLURM_NTASKS
export MKL_NUM_THREADS=$SLURM_NTASKS

cm1.exe &> supercell.out
```

## Results

This code scales very well within a compute node. So, one would ideally want to use as many cores as possible.

