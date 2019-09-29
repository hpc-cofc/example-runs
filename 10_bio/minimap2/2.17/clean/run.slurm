#!/bin/bash
#SBATCH -p stdmemq               # Submit to 'stdmemq' Partitiion or queue
#SBATCH -J jminimap2-test             # Name the job as 'jminimap2-test'
#SBATCH -o jminimap2-test-%j.out      # Write the standard output/stderr to file named 'jminimap2-test-<job_number>.out'
#SBATCH -t 0-24:00:00            # Run for a maximum time of 0 days, 2 hours, 00 mins, 00 secs
#SBATCH --ntasks=1              # Request n cores or task per node
#SBATCH --mem=4G                # Use as much as xGB memory per core

module list                   
module load bio/minimap2/2.17 
module list                   

pwd;ls                         # prints current working directory
date                        # prints start date and time

# Example from https://github.com/lh3/minimap2
# 

#long sequences against a reference genome
gunzip dmel-all-chromosome-r5.37.fasta.gz
minimap2 -a $MINIMAP2_HOME/test/MT-human.fa $MINIMAP2_HOME/test/MT-orang.fa > test.sam
# create an index first and then map
minimap2 -x map-ont -d MT-human-ont.mmi $MINIMAP2_HOME/test/MT-human.fa
minimap2 -a MT-human-ont.mmi $MINIMAP2_HOME/test/MT-orang.fa > test.sam
gzip --best dmel-all-chromosome-r5.37.fasta

# use presets (no test data)
# need to download these to run the tests below
#minimap2 -ax map-pb ref.fa pacbio.fq.gz > aln.sam       # PacBio genomic reads
#minimap2 -ax map-ont ref.fa ont.fq.gz > aln.sam         # Oxford Nanopore genomic reads
#minimap2 -ax asm20 ref.fa pacbio-ccs.fq.gz > aln.sam    # PacBio CCS genomic reads
#minimap2 -ax sr ref.fa read1.fa read2.fa > aln.sam      # short genomic paired-end reads
#minimap2 -ax splice ref.fa rna-reads.fa > aln.sam       # spliced long reads (strand unknown)
#minimap2 -ax splice -uf -k14 ref.fa reads.fa > aln.sam  # noisy Nanopore Direct RNA-seq
#minimap2 -ax splice:hq -uf ref.fa query.fa > aln.sam    # Final PacBio Iso-seq or traditional cDNA
#minimap2 -cx asm5 asm1.fa asm2.fa > aln.paf             # intra-species asm-to-asm alignment
#minimap2 -x ava-pb reads.fa reads.fa > overlaps.paf     # PacBio read overlap
#minimap2 -x ava-ont reads.fa reads.fa > overlaps.paf    # Nanopore read overlap

echo "minimap2: Normal end of execution."

ls
date                        # prints end date and time
exit 0
