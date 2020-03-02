# agisoft

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
- open a remote desktop client to access the CofC HPC
- open a terminal and request a GPU-containing node for interactive use through the SLURM batch
  scheduler
- once the GPU-containing node is reserved, open PhotoScan and perform the simulation/processing

### Specific Steps

#### Connect to the HPC using a remote desktop client

We have a dekstop and web version of the FastX remote desktop (RDP) service to access the HPC. Please see [the instructions here](https://hpc-cofc.gitbook.io/docs/using-the-hpc/access-hpc/gui-remote-desktop)

### Open a terminal and load the proper software stack

- Once the RDP session is established, open a terminal within the the remote desktop environment.
- Go to the location of your images or data for more convenient access
- Load the Agisoft software by entering `module load geology/agisoft/photoscan`

### Request a node/server to run the calculations in

You are 

Speci
[Tutorial for beginners](./agisoft/PS_1.4_Tutorial_BL_-_3D_Model_Reconstruction.pdf)


