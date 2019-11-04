#!/bin/bash
#SBATCH -p stdmemq               # Submit to 'stdmemq' Partitiion or queue
#SBATCH -J jvcftools-test             # Name the job as 'jvcftools-test'
#SBATCH -o jvcftools-test-%j.out      # Write the standard output/stderr to file named 'jvcftools-test-<job_number>.out'
#SBATCH -t 0-24:00:00            # Run for a maximum time of 0 days, 2 hours, 00 mins, 00 secs
#SBATCH --ntasks=1              # Request n cores or task per node
#SBATCH --mem=4G                # Use as much as xGB memory per core

module list                   
module load bio/vcftools/0.1.16 
module list                   

pwd;ls                         # prints current working directory
date                        # prints start date and time

# Example from https://vcftools.github.io/documentation.html 
# 
vcftools --vcf input_data.vcf
vcftools --vcf input_data.vcf --chr 1 --from-bp 1000000 --to-bp 2000000
vcftools --vcf input_data.vcf --chr 1 --from-bp 1000000 --to-bp 2000000 --recode --recode-INFO-all
vcftools --vcf input_data.vcf --chr 1 --from-bp 1000000 --to-bp 2000000 --recode --out subset
vcftools --vcf input_data.vcf --recode-bcf --recode-INFO-all --out converted_output
vcftools --vcf input_data.vcf --freq --out output
vcftools --vcf input_data.vcf --depth -c > depth_summary.txt
vcftools --vcf input_data.vcf --site-depth --max-missing 1.0 --out site_depth_summary
vcftools --vcf input_data.vcf --hap-r2 --ld-window-bp 50000 --out ld_window_50000
vcftools --vcf input_data.vcf --plink --chr 1 --out output_in_plink

#For Perl module versions, see the examples at https://vcftools.github.io/perl_examples.html
# here are two below
perl -MVcf -e validate input_data.vcf 
vcf-validator input_data.vcf 

date                        # prints end date and time
