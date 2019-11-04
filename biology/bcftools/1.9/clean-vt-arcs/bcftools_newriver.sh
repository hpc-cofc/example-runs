#! /bin/bash
#
#PBS -l walltime=0:05:00
#PBS -l nodes=1:ppn=1
#PBS -W group_list=newriver
#PBS -q open_q
#PBS -j oe
#
cd $PBS_O_WORKDIR
#
module purge
module load gcc/5.2.0
module load bcftools/1.2
#
bcftools call -c -v sim_variants.bcf > sim_variants.vcf
#
echo "Normal end of execution."
