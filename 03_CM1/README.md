# CM1 19.8-OMP

CM1 is an atmospheric physics simulation package. Learn more at the [developer's
site](http://www2.mmm.ucar.edu/people/bryan/cm1/). 

## Compilation

This particular installation includes OpenMP parallelism within a compute node. It is compiled with
our Intel compiler and library toolchain. It also leverages netCDF data formats. 

## How to run

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

