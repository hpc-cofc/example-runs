# Example Runs

The sample calculations here are intended to guide you in setting up and running your own
calculations. Each directory provides all the input files and batch submission files needed to run
the particular calculations.
- input file (depends on software package)
- output file (depends on software package)
- SLURM batch submission file (generally named <code>run.slurm</code>)
- SLURM stderr/stdout file (generally named <code>j\<SLURM\_JOB\_NAME\>.o\<SLURM\_JOB\_ID\></code>)

# Directory Structure

```
├── 00_MPI-examples
│   ├── C
│   ├── C++
│   ├── F90
│   └── Python
├── 01_prime-number-finder-on-CPUs-and-GPUs
│   └── code
├── 02_Python
├── 03_R
├── 04-Conda-Miniconda-Anaconda
├── 06_Matlab
├── 07_Mathematica
│   ├── 12.0
│   └── Misc
├── 15_Gaussian
│   └── 16-B01
│       └── new-module-location
├── Jupyter-Notebooks
├── biology
│   ├── angsd
│   │   └── 0.931
│   │       ├── clean
│   │       │   └── assotest
│   │       └── run
│   │           └── assotest
│   ├── bcftools
│   │   └── 1.9
│   │       ├── clean-vt-arcs
│   │       └── run
│   ├── bedtools
│   │   └── 2.29.0
│   │       ├── clean
│   │       └── run
│   ├── bioconda
│   │   ├── clean
│   │   │   ├── assotest
│   │   │   └── bowtie2-example
│   │   │       ├── index
│   │   │       ├── reads
│   │   │       └── reference
│   │   └── run
│   │       ├── assotest
│   │       └── bowtie2-example
│   │           ├── index
│   │           ├── reads
│   │           └── reference
│   ├── bowtie
│   │   └── 1.2.3
│   │       ├── clean
│   │       │   └── indexes
│   │       ├── run
│   │       │   └── indexes
│   │       └── vt-arcs-example
│   │           └── clean
│   │               └── indexes
│   ├── bowtie2
│   │   └── 2.3.5.1
│   │       ├── standard-example
│   │       │   ├── clean
│   │       │   │   └── example
│   │       │   │       ├── index
│   │       │   │       ├── reads
│   │       │   │       └── reference
│   │       │   └── run
│   │       │       └── example
│   │       │           ├── index
│   │       │           ├── reads
│   │       │           └── reference
│   │       └── vt-arcs-example
│   │           ├── clean
│   │           └── run
│   ├── bwa
│   │   └── 0.7.17
│   │       ├── clean
│   │       ├── run
│   │       └── vt-arcs-example
│   ├── hisat2
│   │   └── 2.1.0
│   ├── minimap2
│   │   └── 2.17
│   │       ├── clean
│   │       └── run
│   ├── mothur
│   │   └── 1.43.0
│   │       ├── TestBatches
│   │       │   ├── align.seqs
│   │       │   ├── amova
│   │       │   ├── anosim
│   │       │   ├── binseqs
│   │       │   ├── biom.info
│   │       │   ├── chimera.bellerophon
│   │       │   ├── chimera.vsearch
│   │       │   ├── classify.seqs
│   │       │   ├── make.contigs
│   │       │   ├── make.file
│   │       │   ├── pre.cluster
│   │       │   ├── screen.seqs
│   │       │   ├── summary.seqs
│   │       │   └── unique.seqs
│   │       └── TestBatches-orig
│   │           ├── align.seqs
│   │           ├── amova
│   │           ├── anosim
│   │           ├── binseqs
│   │           ├── biom.info
│   │           ├── chimera.bellerophon
│   │           ├── chimera.vsearch
│   │           ├── classify.seqs
│   │           ├── make.contigs
│   │           ├── make.file
│   │           ├── pre.cluster
│   │           ├── screen.seqs
│   │           ├── summary.seqs
│   │           └── unique.seqs
│   ├── ncbi-blast+
│   │   └── 2.10.0
│   │       ├── standard
│   │       │   ├── clean
│   │       │   └── run
│   │       └── vt-arcs-example
│   │           ├── clean
│   │           └── run
│   ├── samtools
│   │   └── 1.9
│   │       ├── clean
│   │       ├── run
│   │       └── vt-arcs-example
│   └── vcftools
│       └── 0.1.16
│           ├── clean
│           └── run
├── chemistry
│   ├── AMBER
│   │   └── 18
│   │       ├── 0
│   │       │   └── cofc-ohpc-template
│   │       ├── gpu-quadro-p4000
│   │       ├── gpu-tesla-v100
│   │       ├── one-node
│   │       └── two-nodes
│   ├── GAMESS
│   │   └── 2018
│   ├── Gaussian
│   │   └── 16-B01
│   ├── NAMD
│   │   └── 2.13
│   │       ├── multicore+CUDA
│   │       │   └── test-ApoA1
│   │       └── multicore-mpi
│   │           └── test-ApoA1
│   ├── Orca
│   │   └── 4.1.2
│   └── Psi4
│       └── 1.3.1
├── geology
│   ├── WASS
│   └── agisoft
│       ├── metashape
│       └── photoscan
└── physics
    ├── CM1
    │   └── 19.8
    │       ├── squall_line
    │       └── supercell
    └── openFOAM
        └── 7
```
