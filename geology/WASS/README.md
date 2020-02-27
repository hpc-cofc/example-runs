- [Intro](#intro)
- [CofC HPC Notes](#cofc-hpc-notes)
  * [Initial access and setup](#initial-access-and-setup)
  * [WASS-specific details](#wass-specific-details)
    + [Testing in interactive mode on login/master node](#testing-in-interactive-mode-on-login-master-node)
    + [Testing in compute nodes using queue manager](#testing-in-compute-nodes-using-queue-manager)
      - [Batch mode](#batch-mode)
      - [Interactive mode](#interactive-mode)
  * [Running MATLAB](#running-matlab)
    + [Interactive mode on login/master node](#interactive-mode-on-login-master-node)
    + [Interactive mode on compute nodes](#interactive-mode-on-compute-nodes)
    + [Batch mode on compute nodes](#batch-mode-on-compute-nodes)
  * [Interactive mode on compute nodes with remote visualization](#interactive-mode-on-compute-nodes-with-remote-visualization)
    + [Request resources through SLURM](#request-resources-through-slurm)
    + [SSH into the reserved node and run the necessary commands](#ssh-into-the-reserved-node-and-run-the-necessary-commands)
    + [Access visualization and controls using a web browser](#access-visualization-and-controls-using-a-web-browser)

<small><i><a href='http://ecotrust-canada.github.io/markdown-toc/'>Table of contents generated with markdown-toc</a></i></small>


# Intro

Wave Acquisition and Stereo System [WASS](https://www.dais.unive.it/wass/index.html) is an optimized stereo processing pipeline for sea waves 3D reconstruction.

Its features include :

* High-quality 3D point-cloud recovery from stereo frames
* Fully-automatic robust extrinsic calibration of the stereo rig (up to scale)
* Optimized C++ code for fast processing (~30sec per frame for 3 MPixel images on consumer i7 CPU)
* Advanced point-cloud filtering for outlier removal
* Easily controllable with your favourite browser
* Event-driven parallel task management via node.js
* Open source code based on mature open-source components
* Multi-platform support (Linux, OSX, Windows)

# CofC HPC Notes

## Initial access and setup

Please see our HPC documentation page for information about
* Accessing the cluster
  * [Using a commandline](https://hpc-cofc.gitbook.io/docs/using-the-hpc/access-hpc)
  * [Using a remote desktop client](https://hpc-cofc.gitbook.io/docs/using-the-hpc/access-hpc/gui-remote-desktop) -- we encourage this approach for any graphics-intensive applications
* [Transferring data](https://hpc-cofc.gitbook.io/docs/using-the-hpc/transfer-data)
* [Access software](https://hpc-cofc.gitbook.io/docs/using-the-hpc/modules)

and [a lot more ... ](https://hpc-cofc.edu/docs)

## WASS-specific details

We have run demos showing the test example provided by the developer can run
* in interactive mode on the head/master node
* in batch mode using the SLURM queue manager
* in interactive mode using the SLURM queue manager


The software is installed in users' local area under `$HOME/gnu83/`. It needs access to MATLAB and CUDA libraries among others.

### Testing in interactive mode on login/master node

You can run a quick test on the login/master node of the HPC to make sure things are working properly.

To run the test in interactive mode, please enter the following commands in a terminal
* go to the directory containing WASS:
  * `cd $HOME/gnu83/wass`
* make a copy of the `test` directory. We are copying it to `test-random`, but you can pick any name
  * `cp -r test test-random`
* go into the copy directory
  * `cd test-random`
* load up MATLAB and CUDA libraries
  * `module load math/matlab/r2019a cuda/10.1`
* run the test by entering the following command
  * `matlab -nodesktop -nodisplay -nosplash < ./test_pipeline.m > ./test_pipeline-interactive-mode.out`

The test takes about 15 minutes to complete. When it is complete, you should have a file named `test_pipeline-interactive-mode.out` and a directory called `output` in the same test folder.


### Testing in compute nodes using queue manager

While testing on the login/master node interactively is acceptable, you should run your production simulations in the compute nodes using our batch scheduler (SLURM).

#### Batch mode

To run the test in batch mode on a compute node, please enter the following commands in a terminal
* go to the directory containing WASS:
  * `cd $HOME/gnu83/wass`
* make a copy of the `test` directory. We are copying it to `test-batch`, but you can pick any name
  * `cp -r test test-batch`
* go into the copy directory
  * `cd test-random`
* create/copy/edit the batch submission file (lets call it `run.slurm`) below

```bash
#!/bin/bash
#SBATCH -p gpuq                # Submit to 'gpuq' Partitiion or queue
#SBATCH -J jgpuq-test          # Name the job as 'MPItest'
#SBATCH -o jgpuq-test-%j.out   # Write the standard output to file named 'jxxx-<job_number>.out'
#SBATCH -t 0-02:00:00               # Run for a maximum time of 0 days, 02 hours, 00 mins, 00 secs
#SBATCH --nodes=1                   # Request N nodes
#SBATCH --ntasks-per-node=1        # Request n cores or task per node
#SBATCH --mem-per-cpu=4GB           # Request 4GB RAM per core
#SBATCH --gres=gpu:v100:0           # Request 0/1 NVIDIA Tesla V100 GPU
#SBATCH --mail-type=ALL             # Send email notification at the start and end of the job
#SBATCH --mail-user=temelsob@cofc.edu    # Send email notification to this address

module list                 # will list modules loaded by default.
pwd                         # prints current working directory
date                        # prints the date and time

# see the many SLURM environmental variables
env | grep -i slurm

module load math/matlab/r2019a
module load cuda/10.1

matlab -nodesktop -nodisplay -nosplash < ./test_pipeline.m > ./test_pipeline-batch-mode.out
```
* submit the batch submission file (`run.slurm`) to the queue manager
  * `sbatch run.slurm`
* enter `squeue` periodically to see its status. It should finish in about 15 minutes.  

#### Interactive mode

To run the test in interactive mode on a compute node, please enter the following commands in a terminal

* request for time on a compute node
  * `run-slurm-interactive.sh`
* when the compute node is available, you will be logged into a compute node
* go to the directory containing WASS:
  * `cd $HOME/gnu83/wass`
* make a copy of the `test` directory. We are copying it to `test-interactive`, but you can pick any name
  * `cp -r test test-interactive`
* go into the copy directory
  * `cd test-interactive`
* load up MATLAB and CUDA libraries
  * `module load math/matlab/r2019a cuda/10.1`
* run the test by entering the following command
  * `matlab -nodesktop -nodisplay -nosplash < ./test_pipeline.m > ./test_pipeline-interactive-mode.out`

Please note that the compute node is reserved to you for the length of time you have requested. If you finish early , please log out by entering `exit` on the command line.

## Running MATLAB

Much like WASS above, you can run MATLAB in the following three modes.

* in interactive mode on the head/master node for light testing
* in batch mode using the SLURM queue manager for production runs
* in interactive mode using the SLURM queue manager for resource-intensive tests or production runs

Note: We are assuming you are connecting to the cluster using a [remote desktop (RDP) client](https://hpc-cofc.gitbook.io/docs/using-the-hpc/access-hpc/gui-remote-desktop).

### Interactive mode on login/master node

You can use the following steps to start up a MATLAB session.

* search for MATLAB versions
  * `module spider matlab`
  * you will see that there are multiple versions of MATLAB (r2017b, r2018a, ... r2019a)
* load up the version of MATLAB you want. Let's assume it is version r2019a
  * `module load math/matlab/r2019a`
* open matlab
  * GUI - `matlab`
  * text-based -  `matlab -nodesktop -nodisplay -nosplash`

### Interactive mode on compute nodes

You can use the following steps to start up a MATLAB session.

* request for time on a compute node
  * `run-slurm-interactive.sh`
* when the compute node is available, you will be logged into a compute node
* search for MATLAB versions
  * `module spider matlab`
  * you will see that there are multiple versions of MATLAB (r2017b, r2018a, ... r2019a)
* load up the version of MATLAB you want. Let's assume it is version r2019a
  * `module load math/matlab/r2019a`
* open matlab
  * GUI - `matlab`
  * text-based -  `matlab -nodesktop -nodisplay -nosplash`

### Batch mode on compute nodes

You can use the following steps to submit MATLAB calculations to run in batch mode on compute nodes

* go to the directory containing your MATLAB scripts:
* create/copy/edit the batch submission file (lets call it `run.slurm`) below

```bash
#!/bin/bash
#SBATCH -p debugq                # submit to the debug queue
#SBATCH -J jmlab-test            # name of job
#SBATCH -o jmlab-test-%j         # name of stdout file
#SBATCH -e jmlab-test-%j         # name of stderr file
#SBATCH --nodes=1                # 1 node
#SBATCH --ntasks-per-node=24     # 24 cores pde node
#SBATCH --mem-per-cpu=4GB        # 4000MB (4GB) RAM per core
#SBATCH --export=ALL             # export default environment
#SBATCH --gres=gpu:v100:0
#SBATCH -t 0-00:30:00            # run for 0-days, 0 hours, 30 minutes

set echo

umask 0022

cd $SLURM_SUBMIT_DIR
module list                      # list currently loaded modules

module load math/matlab/r2017b

# Your job-specific details below
matlab -nodesktop -nodisplay -nosplash < ./simple.m  > output.log
```
* Once you have made the necessary changes, submit the job to the queue manager
  * `sbatch run.slurm`
* enter `squeue` periodically to see its status.


## Interactive mode on compute nodes with remote visualization

To run WASS in interactive mode on the compute nodes and visualize the results remotely, you would need to follow these steps:
1. Request resources through SLURM
2. Once resources have been reserved for you, you can open a second terminal and SSH into the node that you reserved to you and run the necessary commands to start the simulation
3. To visualize the output via a web browser, there are three possible options
   * use the reserved node
   * use the login/master node
   * use your local computer

The best option is to use our remote desktop client to log into the cluster and do the visualization within a browser on the login/master node.

The steps for all three procedures are outlined below:
<!--
re   * use the the best option is to use SSH port forwarding if you want to see it on a browser on your local machine, or pointing your browser to <nodename>:<port_number>
-->

Here are updated steps:

### Request resources through SLURM
* In a terminal on the login/master node, execute this command to request resources for interactive use
```bash
user@hpc[~]    run-slurm-interactive.sh
```
Set run time and cores. Our nodes have different number of cores. Please see [the hardware specs of
our nodes first](https://hpc-cofc.gitbook.io/docs/using-the-hpc/scheduling-jobs-1#compute-nodes).
**VERY IMPORTANT NOTE**: *It
looks like WASS uses up all the CPU cores availble to it. Therefore, unless you know how to control the
number of CPU cores it uses, please request the maximum number of cores per node (80 for bigmemq
nodes, 40 for stdmemq nodes, 24 for gpuq nodes). Otherwise, it will run your simulations along with other users' and oversubscribe the nodes, leading to a significant slowdown in performance and potential hardware failures from sustained overload.* The queue manager will reserve the proper node
based on the number of cores you request. You should be able to see the name of the reserved node by
looking at the Bash prompt. For example, the Bash prompt below indicates indicates that the reserved
node is `gpuv100002`
```bash
user@gpuv100002[~/]
```
* Run the command needed to start a job in the reserved node. For example,
```bash
user@gpuv100002[~/]    cd /home/$USER/gnu83/wass/WASSjs/ext/
user@gpuv100002[~/]    ./launch_redis.sh
```

### SSH into the reserved node and run the necessary commands
* In a separate terminal, SSH into the node that is reserved to you, which we'll call `gpuv100002` for this example.
  * **METHOD 1 - Preferred Method** - If you are using our remote desktop client and are already logged into the HPC, open a second terminal and ssh into the reserved node using following command
  ```bash
  user@hpc[~] ssh gpuv100002
  ```
  * **METHOD 2** - If you are logged into the HPC from your local computer using a terminal, open a second terminal, log into the HPC first and SSH into the reserved node
    * two steps
    ```bash
    user@localmachine[~] ssh -Y <username>@hpc.cofc.edu
    user@hpc[~] ssh -Y <username>@<reserved_node>
    ```
    * one step using using SSH tunneling to get to the reserved node through the login node
    ```bash
    user@localmachine[~] ssh -t -Y <username>@hpc.cofc.edu ssh -Y <reserved_node>
    ```
    Eg:
    ```bash
    user@localmachine[~]    ssh -t -Y $USER@hpc.cofc.edu ssh -Y gpuv100002
    ```
* Execute the necessary commands. For example,
```bash
user@gpuv100002[~]  cd /home/$USER/gnu83/wass/WASSjs/
user@gpuv100002[~]  node Wass.js
```

### Access visualization and controls using a web browser
There are three ways you can do this depending on how you are connected to the cluster.
1. on the reserved node
2. on the login/master node [**Preferred method**]
3. on your local computer

* [**METHOD 1**] - On the reserved node, open a web browser and point it to the right currently
```bash
user@gpuv100002[~] firefox http://localhost:8080
```
Open a second tab and point to the URL to http://localhost:3000 if necessary
* [**METHOD 2 - Preferred Method**] - if you are using our remote desktop client, you can open a browser on the login/master node and point it to `http://<reserved_host_name>:<port_number>`. For example,
```bash
user@hpc[~] firefox http://gpv100002.cofc.edu:8080
Eg. http://gpv100002.cofc.edu:3000
```
Open a second tab and point to the URL to http://gpv100002.cofc.edu:3000 if necessary
* [**METHOD 3**] - On your local computer, you can set up SSH port forwarding and view the WASS visualizations and controls on your local broswer
  * Open a terminal on your local computer
  * Set up SSH port forwarding over all the pertinent ports. For example,
  ```bash
  user@localmachine[~]   ssh -NL 3000:gpuv100002.cofc.edu:3000 -NL  8080:gpuv100002.cofc.edu:8080 -NL 6379:gpuv100002.cofc.edu:6379 <username>@hpc.cofc.edu
  ```
  Once you enter your credentials for hpc.cofc.edu, the terminal will hang, indicating that port forwarding is established
* Open a browser on your local computer and point it at `http://localhost:<port_number>` such as `http://localhost:8080` or `http://localhost:3000`

In short, using a remote desktop (RDP) client to set up, run and monitor the simulations is the most convenient o
