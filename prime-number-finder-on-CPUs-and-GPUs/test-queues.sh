#!/bin/bash
# Tests whether all four queues/partitions work using a
#  prime number generator problem as an example 
#
# 05/09/2019
#

for queues in stdmemq debugq bigmemq gpuq
   do 
   sed -e "s/__QUEUE__/$queues/g" -e "s/__USER__/$USER/g" template.slurm > run-$queues.slurm
   if [ "$queues" == "gpuq" ] ; then
      sed -i "s/__GPU__/1/g" run-$queues.slurm
   else
      sed -i "s/__GPU__/0/g" run-$queues.slurm
   fi
   sbatch run-$queues.slurm
   done
