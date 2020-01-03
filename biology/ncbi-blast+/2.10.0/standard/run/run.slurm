#!/bin/bash
#SBATCH -p stdmemq               # Submit to 'stdmemq' Partitiion or queue
#SBATCH -J jblast-test             # Name the job as 'jblast-test'
#SBATCH -o jblast-test-%j.out      # Write the standard output to file named 'jblast-test-<job_number>.out'
#SBATCH -e jblast-test-%j.err      # Write the standard stderr to file named 'jblast-test-<job_number>.err'
#SBATCH -t 0-24:00:00            # Run for a maximum time of 0 days, 2 hours, 00 mins, 00 secs
#SBATCH --ntasks=1              # Request n cores or task per node
#SBATCH --mem=4G                # Use as much as xGB memory per core

module list                   
module load bio/blast/2.10.0
module list                   

pwd;ls                         # prints current working directory
date                        # prints start date and time

# Example from https://www.ncbi.nlm.nih.gov/books/NBK52640/

export BLASTDB=$HOME/blastdb  

blastdbcmd -db refseq_rna.00 -entry nm_000122 -out test_query.fa
blastn -query test_query.fa -db refseq_rna.00 -task blastn -dust no -outfmt "7 qseqid sseqid evalue bitscore" -max_target_seqs 2

#### the expected output should look like this:
# BLASTN 2.2.29+
# Query: gi|263191547|ref|NM_000122.3| Homo sapiens mutL homolog 1 (MLH1), transcript variant 1, mRNA
# Database: refseq_rna.00
# Fields: query id, subject id, evalue, bit score
# 2 hits found
# gi|263191547|ref|NM_000122.3|   gi|263191547|ref|NM_000122.3|   0.0      4801
# gi|263191547|ref|NM_000122.3|   gi|332816398|ref|XM_001170433.2|        0.0      4758
# BLAST processed 1 queries

date                        # prints end date and time
