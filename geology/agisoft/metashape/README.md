# Agisoft Metashape

**Note** - these instructions are exactly the same as that for Agisoft Photoscan. If you have used
Agisoft Photoscan on the CofC HPC, using Metashape should be very similar.

- [Agisoft Metashape](#agisoft-metashape)
- [Intro](#intro)
- [CofC Notes](#cofc-notes)
  * [License Issues](#license-issues)
- [How to run Agisoft Metashape](#how-to-run-agisoft-metashape)
  * [General steps](#general-steps)
  * [Specific Steps](#specific-steps)
    + [Connect to the HPC using a remote desktop client](#connect-to-the-hpc-using-a-remote-desktop-client)
    + [Open a terminal and load the proper software stack](#open-a-terminal-and-load-the-proper-software-stack)
    + [Request a node/server to run the calculations in](#request-a-node-server-to-run-the-calculations-in)
    + [Do an example run](#do-an-example-run)
      - [Access data and instructions](#access-data-and-instructions)
      - [Open Metashape and start processing](#open-metashape-and-start-processing)
  * [Demo run](#demo-run)
    + [Complete demo](#complete-demo)
    + [Short Asciinema cast](#short-asciinema-cast)

<small><i><a href='http://ecotrust-canada.github.io/markdown-toc/'>Table of contents generated with markdown-toc</a></i></small>



# Intro

[Agisoft Metashape](https://www.agisoft.com) is a professional tool for a photogrammetry pipeline.
It has a lot of features in image processing algorithms, with digital photogrammetry techniques
setting the direction for development of applied tools.

# CofC Notes

<!--
## License Issues

We currently do not have a license for the Pro version of Metashape/MetaShape and are only running
the demo version. It is not possible to save one's work without a license.
-->

# How to run Agisoft Metashape

## General steps
As Agisoft is an image processing application that can use GPUs, the best way to run it is
interactively on GPU-containing nodes. To do that, one can take these steps
- open a remote desktop session to access the CofC HPC
- open a terminal and load the Agisoft Metashape software and its dependencies
- request a GPU-containing node for interactive use through the SLURM batch
  scheduler
- once the GPU-containing node is reserved, open PhotoScan and perform the simulation/processing

## Specific Steps

### Connect to the HPC using a remote desktop client

We have a dekstop and web version of the FastX remote desktop (RDP) service to access the HPC. Please see [the instructions here](https://hpc-cofc.gitbook.io/docs/using-the-hpc/access-hpc/gui-remote-desktop)

The easiest way to open an RDP session is using the web client by going to https://hpc.cofc.edu/rdp

### Open a terminal and load the proper software stack

- Once the RDP session is established, open a terminal within the the remote desktop environment.
- Go to the location of your images or data for more convenient access
- Load the Agisoft Metashape software by entering `module load geology/agisoft/metashape`

### Request a node/server to run the calculations in

We have a script called `run-slurm-interactive.sh` to guide you through the process of requesting resource  through the SLURM batch scheduler.

- Execute `run-slurm-interactive.sh` in a terminal. Sensible choices would be
  - queue 
    - `3. gpuq` - you would want to select this choice to run on nodes with GPUs
  - number of hours 
    - your choice between 0 and 48 hours. Please exit (enter `exit` in your terminal window) from the node/server assigned to you when you finish to make sure it is available for others
  - number of cores 
    - as many as 24, although you should pick just the number of cores you need to make sure the remaining resources are available to other users.

### Do an example run

There are beginner and intermediate level tutorials on Metashape
- Data - download [the necessary images](https://www.agisoft.com/downloads/sample-data/)
- Instructions - There are many [tutorials for beginner and intermediate levels](https://www.agisoft.com/support/tutorials)

#### Access data and instructions
For our example run, the one we will use is the "doll" example. Please download the data(images) and instructions
- **Data** - download [https://www.agisoft.com/datasets/doll.zip](https://www.agisoft.com/datasets/doll.zip). If you are already logged into the HPC, you can find it at `/opt/ohpc/pub/apps/geology/agisoft/metashape/Examples/`
- **Instructions** - use the [tutorial for beginners provided in our GitHub Repo](./PS_1.4_Tutorial_BL_-_3D_Model_Reconstruction.pdf) 

#### Open Metashape and start processing

If you have entered `module load geology/agisoft/metashape` in the login/master node earlier, your whole environment is exported to the compute node reserved to you. Therefore, the Metashape binaries and libraries should be in your $PATH. If you want to double-check, you can execute `module list` and confirm that `geology/agisoft/metashape` and `openblas/0.3.6` are listed in the output. If not, please load `module load geology/agisoft/metashape` again.

To open Metashape GUI from your terminal, please enter `metashape.sh`.

## Demo run
These are for Agisoft Photoscan, but they should work just the same for Agisoft Metashape.

### Complete demo
If you have a CofC login credential, you can look at a video including steps on logging in using a web RDP client is available on OneDrive [here](https://cofc-my.sharepoint.com/:v:/g/personal/temelsob_cofc_edu/EVsGIiVvslJBl5xLIdEdMVcBqhAY6ArWbRoVoWoc2MfaHA?e=RyFy0g)

### Short Asciinema cast
Below is an Asciinema recording of a sample session:
[![asciicast](https://asciinema.org/a/307000.svg)](https://asciinema.org/a/307000?t=1)
