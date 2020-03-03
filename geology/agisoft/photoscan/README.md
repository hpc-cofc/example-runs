# Agisoft Photoscan

# Intro

[Agisoft Photoscan](https://www.agisoft.com) which is rebranded as Agisoft Metashape, is a
professional tool for a photogrammetry pipeline. It has a lot of features in image processing
algorithms, with digital photogrammetry techniques setting the direction for development of applied
tools.

# CofC Notes

## License Issues

We currently do not have a license for the Pro version of Photoscan/MetaShape and are only running
the demo version. It is not possible to save one's work without a license.

## How to run Agisoft Photoscan

### General steps
As Agisoft is an image processing application that can use GPUs, the best way to run it is
interactively on GPU-containing nodes. To do that, one can take these steps
- open a remote desktop session to access the CofC HPC
- open a terminal and load the Agisoft Photoscan software and its dependencies
- request a GPU-containing node for interactive use through the SLURM batch
  scheduler
- once the GPU-containing node is reserved, open PhotoScan and perform the simulation/processing

### Specific Steps

#### Connect to the HPC using a remote desktop client

We have a dekstop and web version of the FastX remote desktop (RDP) service to access the HPC. Please see [the instructions here](https://hpc-cofc.gitbook.io/docs/using-the-hpc/access-hpc/gui-remote-desktop)

The easiest way to open an RDP session is using the web client by going to https://hpc.cofc.edu/rdp

### Open a terminal and load the proper software stack

- Once the RDP session is established, open a terminal within the the remote desktop environment.
- Go to the location of your images or data for more convenient access
- Load the Agisoft Photoscan software by entering `module load geology/agisoft/photoscan`

### Request a node/server to run the calculations in

We have a script called `run-slurm-interactive.sh` to guide you through the process of requesting resource  through the SLURM batch scheduler.

- Execute `run-slurm-interactive.sh` in a terminal. Sensable choices would be
  - queue 
    - (3. gpuq) - you would want to select this choice to run on nodes with GPUs
  - number of hours 
    - your choice between 0 and 48 hours. Please exit (enter `exit` in your terminal window) from the node/server assigned to you when you finish to make sure it is available for others
  - number of cores 
    - as many as 24, although you should pick just the number of cores you need to make sure the remaining resources are available to other users.

### Do an example run

There are beginner and intermediate level tutorials on Photoscan and Metashape 
- Data - download [the necessary images](https://www.agisoft.com/downloads/sample-data/)
- Instructions - There are many [tutorials for beginner and intermediate levels](https://www.agisoft.com/support/tutorials)

#### Access data and instructions
For our example run, the one we will use is the "doll" example. Please download the data(images) and instructions
- **Data** - download [https://www.agisoft.com/datasets/doll.zip](https://www.agisoft.com/datasets/doll.zip). If you are already logged into the HPC, you can find it at `/opt/ohpc/pub/apps/geology/agisoft/photoscan/Examples/`
- **Instructions** - use the [tutorial for beginners provided in our GitHub Repo](./agisoft/PS_1.4_Tutorial_BL_-_3D_Model_Reconstruction.pdf) 

#### Open Photoscan and start processing

If you have entered `module load geology/agisoft/photoscan` in the login/master node earlier, your whole environment is exported to the compute node reserved to you. Therefore, the Photoscan binaries and libraries should be in your $PATH. If you want to double-check, you can execute `module list` and confirm that `geology/agisoft/photoscan` and `openblas/0.3.6` are listed in the output. If not, please load `module load geology/agisoft/photoscan` again.

To open Photoscan GUI from your terminal, please enter `photoscan.sh`.

Good luck with your computations!
