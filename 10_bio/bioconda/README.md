
# Installing Bioinformatics Pacakges using Conda Package Manager
You can use the `conda` package manager to install a lot of bioinformatics packages from the following channels among others.
- [bioconda](https://bioconda.github.io/)
- bioinfo
- biobuilds

The main advantages of this approach are
- it is much easier to install packages this way instead of downloading each one individually, compiling it, worrying about paths and dependencies ...
- you will have your own environment and utilities in your own user space (`~$USER/.conda`).
- you can modify, update, change or delete this environment without needing superuser privileges or affecting any other user/system

The steps involved are
- load the anaconda3 or miniconda3 module to access the `conda` package manager
- **the first time you use the `conda` package manager**, create a Python environment
- activate that Python environment
- search for the bioinformatics packages in the proper channels
- if they are available, install them.
- after that, you would just need to load anaconda3 or miniconda3 modules and activate the right Python environment to access the packages you installed.

These steps are described in detail below.


## Load Miniconda or Anaconda
The `conda` package manager is included in the lightweight `Miniconda` distribution or the bulkier `Anaconda` distribution. We recommend using with `Miniconda` unless you are doing heavy data science. They both depend on Python and we encourage using Python3 since support for Python2 will end over the next year.

```css
[user@host]   module load miniconda3/4.7.0
[user@host]   which conda

/opt/ohpc/pub/apps/miniconda/miniconda3/bin/conda
```

The first time around, there should only be a shared base environment that you do not have the privileges to modify.

```css
[user@host]  conda env list
# conda environments:
#
base                     /opt/ohpc/pub/apps/miniconda/miniconda3
```

## Create Python3 environment  Miniconda or Anaconda

python27                 /home/test-user/.conda/envs/python27
python35-intel        *  /home/test-user/.conda/envs/python35-intel
python37-intel           /home/test-user/.conda/envs/python37-intel





CondaWe ahve

# First you need
The syn
