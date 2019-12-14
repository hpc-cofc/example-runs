
# Installing Bioinformatics Packages using Conda Package Manager
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

# One-time setup
## Load Anaconda
The `conda` package manager is included in the lightweight `Miniconda` distribution or the bulkier `Anaconda` distribution. We recommend using with `Miniconda` unless you are doing heavy data science. They both depend on Python and we encourage using Python3 since support for Python2 will end over the next year.

```css
[user@host]   module load anaconda3/2019.03
[user@host]   which conda

/opt/ohpc/pub/apps/anaconda/anaconda3-2019.03/condabin/conda
```

The first time around, there should only be a shared base environment that you do not have the privileges to modify.

```css
[user@host]  conda env list
# conda environments:
#
base                     /opt/ohpc/pub/apps/miniconda/miniconda3
```

You want to create a custom environment in your local area (`/home/$USER/.conda/envs`) which you will have full control over.

## Create Python3 environment

The most stable and mature version of Python at the moment is Python 3.7. 

```css
[user@host] conda create -n myPython37 python=3.7

[user@host]  conda env list
# conda environments:
#
base                     /opt/ohpc/pub/apps/miniconda/miniconda3
myPython37               /home/test-user/.conda/envs/myPython37
```

## Install any bioinformatics software

According to the [BioConda site](https://bioconda.github.io/), there are more than 6000 bioinformatics packages in the bioconda repository mainainted by 600+ contributors. 

### Add bioconda channel
The first thing to do is add the bioconda repository/channel. 


```css
[user@host]   module load anaconda3/2019.03
[user@host]   source activate myPython37
[user@host]   conda config --add channels bioconda
```

### Start installing software

Once the bioconda repo is added, you can proceed to search and install packages

```css
[user@host]   conda search samtools
[user@host]   conda install samtools 
.
.
.
```
# Using Conda-installed packages

All conda packages you install will be stored in your personal space (`/home/$USER/.conda`). To access these packages, you would need to load the `anaconda3` module and activate the right environment.  Here is an example:

```css
[user@host]   module load anaconda3/2019.03
[user@host]   source activate myPython37
[user@host]   samtools view -bS eg2.sam > eg2.bam
[user@host]   samtools sort eg2.bam -o eg2.sorted.bam
```

You can include these commands in your SLURM batch submission files. Here is an example file called `run.slurm`:

```css
#!/bin/bash
#SBATCH -p stdmemq               # Submit to 'stdmemq' Partitiion or queue
#SBATCH -J jbioconda-test             # Name the job as 'jbioconda-test'
#SBATCH -o jbioconda-test-%j.out      # Write the standard output to file named 'jbioconda-test-<job_number>.out'
#SBATCH -e jbioconda-test-%j.err      # Write the standard stderr to file named 'jbioconda-test-<job_number>.err'
#SBATCH -t 0-24:00:00            # Run for a maximum time of 0 days, 2 hours, 00 mins, 00 secs
#SBATCH --ntasks=8              # Request n cores or task per node
#SBATCH --mem=32G                # Use as much as xGB memory per core

module list                   
module load anaconda3
source activate jupyter_3.7

which samtools
samtools view -b -S -o sim_reads_aligned.bam sim_reads_aligned.sam
samtools view -bS eg2.sam > eg2.bam
samtools sort eg2.bam -o eg2.sorted.bam
samtools mpileup -uf $HISAT2_HOME/example/reference/22_20-21M.fa eg2.sorted.bam | bcftools view -bvcg - > eg2.raw.bcf
...

```

You can see examples of a batch run in the `clean` and `run` directories.
