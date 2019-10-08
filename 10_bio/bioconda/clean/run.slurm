#!/bin/bash
#SBATCH -p stdmemq               # Submit to 'stdmemq' Partitiion or queue
#SBATCH -J jbioconda-test             # Name the job as 'jbioconda-test'
#SBATCH -o jbioconda-test-%j.out      # Write the standard output to file named 'jbioconda-test-<job_number>.out'
#SBATCH -e jbioconda-test-%j.err      # Write the standard stderr to file named 'jbioconda-test-<job_number>.err'
#SBATCH -t 0-24:00:00            # Run for a maximum time of 0 days, 2 hours, 00 mins, 00 secs
#SBATCH --ntasks=8              # Request n cores or task per node
#SBATCH --mem=32G                # Use as much as xGB memory per core

module list                   
module load anaconda3
source activate jupyter_3.7
echo $PATH

pwd;ls                         # prints current working directory
date                        # prints start date and time

################## Angsd
which angsd
angsd -doMaf 4 -beagle assotest/test.beagle -fai hg19.fa.fai -yBin assotest/test.phe -doAsso 6 -out tmp -minCount 0 -minHigh 0 -seed 123


################# bedtools
# Example from https://bedtools.readthedocs.io/en/latest/
which bedtools
bedtools intersect -a input.bed -b input-short.bed -f 0.50 -r
bedtools closest -a input.bed -b input-short.bed -io

################# Bowtie
which bowtie
bowtie -t e_coli e_coli_1000.fq e_coli.map &> bowtie_newriver.txt

################# Bowtie2
# running in parallel using '-p $SLURM_NTASKS' option
which bowtie2
echo "Aligning unpaired reads "
bowtie2 -p $SLURM_NTASKS -x ./bowtie2-example/index/lambda_virus -U ./bowtie2-example/reads/longreads.fq

echo "Aligning paired reads"
bowtie2 -p $SLURM_NTASKS -x ./bowtie2-example/index/lambda_virus -1 ./bowtie2-example/reads/reads_1.fq -2 ./bowtie2-example/reads/reads_2.fq

echo "Building a small index"
bowtie2-build ./bowtie2-example/reference/lambda_virus.fa ./bowtie2-example/index/lambda_virus

echo "Building a large index"
bowtie2-build --large-index ./bowtie2-example/reference/lambda_virus.fa ./bowtie2-example/index/lambda_virus

echo "Inspecting a lambda_virus index (small index) and outputting the summary"
bowtie2-inspect --summary ./bowtie2-example/index/lambda_virus

echo "Inspecting the entire lambda virus index (large index)" 
bowtie2-inspect --large-index ./bowtie2-example/index/lambda_virus

################# BWA
#  Index the reference genome.
which bwa
unpigz -p $SLURM_NTASKS dmel-all-chromosome-r5.37.fasta.gz 
bwa index dmel-all-chromosome-r5.37.fasta
if [ $? -ne 0 ]; then
  echo "BWA_NEWRIVER: Run error!"
  exit 1
fi
#
#  Align the reads against the reference.
#
bwa aln -I -t 8 dmel-all-chromosome-r5.37.fasta read.fasta > out.sai
if [ $? -ne 0 ]; then
  echo "BWA_NEWRIVER: Run error!"
  exit 1
fi
#
#  Convert the alignment into a SAM file.
#
bwa samse dmel-all-chromosome-r5.37.fasta out.sai read.fasta > out.sam
if [ $? -ne 0 ]; then
  echo "BWA_NEWRIVER: Run error!"
  exit 1
fi
#
pigz -p $SLURM_NTASKS dmel-all-chromosome-r5.37.fasta
echo "BWA_NEWRIVER: Normal end of execution."


################# Hisat2
# Example from https://hisat2.github.io/documentation.html 
# 
which hisat2
which hisat
export HISAT2_HOME=/opt/ohpc/pub/apps/bio/hisat2/2.1.0
echo "step 1"
hisat2-build $HISAT2_HOME/example/reference/22_20-21M.fa --snp $HISAT2_HOME/example/reference/22_20-21M.snp 22_20-21M_snp

echo "step 2"
hisat2 -f -x $HISAT2_HOME/example/index/22_20-21M_snp -U $HISAT2_HOME/example/reads/reads_1.fa -S eg1.sam

echo "step 3"
hisat2 -f -x $HISAT2_HOME/example/index/22_20-21M_snp -1 $HISAT2_HOME/example/reads/reads_1.fa -2 $HISAT2_HOME/example/reads/reads_2.fa -S eg2.sam

echo "step 4"
hisat -f -x $HISAT2_HOME/example/index/22_20-21M_snp -1 $HISAT2_HOME/example/reads/reads_1.fa -2 $HISAT2_HOME/example/reads/reads_2.fa -S eg2.sam

echo "step 5"
samtools view -bS eg2.sam > eg2.bam
samtools sort eg2.bam -o eg2.sorted.bam

echo "step 6"
samtools mpileup -uf $HISAT2_HOME/example/reference/22_20-21M.fa eg2.sorted.bam | bcftools view -bvcg - > eg2.raw.bcf
# bcftools
bcftools view eg2.raw.bcf


################# MiniMap2
# Example from https://github.com/lh3/minimap2
which minimap2
export MINIMAP2_HOME=/opt/ohpc/pub/apps/bio/minimap2/2.17

# long sequences against a reference genome
unpigz -p $SLURM_NTASKS dmel-all-chromosome-r5.37.fasta.gz
minimap2 -a $MINIMAP2_HOME/test/MT-human.fa $MINIMAP2_HOME/test/MT-orang.fa > test.sam
# create an index first and then map
minimap2 -x map-ont -d MT-human-ont.mmi $MINIMAP2_HOME/test/MT-human.fa
minimap2 -a MT-human-ont.mmi $MINIMAP2_HOME/test/MT-orang.fa > test.sam
pigz -p $SLURM_NTASKS dmel-all-chromosome-r5.37.fasta

################# Sambamba
# Example from http://lomereiter.github.io/sambamba/docs/sambamba-view.html#EXAMPLES 
which sambamba

cp eg2.bam ex1_header.bam
 #Print basic reference sequence information:
 sambamba view --reference-info ex1_header.bam
 #Count reads with mapping quality not less than 50:
 sambamba view -c -F "mapping_quality >= 50" ex1_header.bam
 #Count properly paired reads overlapping 100..200 on chr1:
 sambamba view -c -F "proper_pair" ex1_header.bam chr1:100-200
 #Output header in JSON format:
 sambamba view --header --format=json ex1_header.bam


################# Samtools
which samtools
samtools view -b -S -o sim_reads_aligned.bam sim_reads_aligned.sam


source deactivate

ls
date                        # prints end date and time
exit 0


