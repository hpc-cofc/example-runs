#!/bin/bash
#SBATCH -p stdmemq               # Submit to 'stdmemq' Partitiion or queue
#SBATCH -J jblast-test             # Name the job as 'jblast-test'
#SBATCH -o jblast-test-%j.out      # Write the standard output to file named 'jblast-test-<job_number>.out'
#SBATCH -e jblast-test-%j.err      # Write the standard stderr to file named 'jblast-test-<job_number>.err'
#SBATCH -t 0-24:00:00            # Run for a maximum time of 0 days, 2 hours, 00 mins, 00 secs
#SBATCH --ntasks=1              # Request n cores or task per node
#SBATCH --mem=4G                # Use as much as xGB memory per core

module list                   
module load bio/ncbi-blast+/2.10.0
module list                   

pwd;ls                         # prints current working directory
date                        # prints start date and time

# Example from https://secure.hosting.vt.edu/www.arc.vt.edu/wp-content/uploads/2017/07/ncbi-blast_example.tar.gz

# download and uncompress ftp://ftp.ncbi.nlm.nih.gov/blast/db/FASTA/drosoph.nt.gz
export BLASTDB=$HOME/blastdb  


# download and uncompress ftp://ftp.ncbi.nlm.nih.gov/blast/db/FASTA/drosoph.nt.gz
#  Unzip the database.
#
# echo "Unzipping the database."
gunzip drosoph.nt.gz
#
#  Reformat the database.
#
makeblastdb -in drosoph.nt -dbtype nucl -parse_seqids
if [ $? -ne 0 ]; then
  echo "NCBI-BLAST+_NEWRIVER: Compile error."
  exit 1
fi
#
#  Run ncbi-blast+ against the test sequence file blast.in
#
echo "Running BLASTN."
blastn -query blast.in -db drosoph.nt -task blastn -out output.txt
if [ $? -ne 0 ]; then
  echo "NCBI-BLAST+_NEWRIVER: Compile error."
  exit 1
fi
#
#  Rezip the database.
#
echo "Zipping the database."
gzip drosoph.nt
#
echo "NCBI-BLAST+_NEWRIVER: Normal end of execution."
exit 0

