#  bwa

##  Introduction:

**BWA** is a program for fast and accurate alignment of short reads using the
Burrows-Wheeler alignment method.

BWA maps low-divergent sequences against a large reference genome, such as the
human genome. It consists of three algorithms:

  * BWA-backtrack; 
  * BWA-SW; 
  * BWA-MEM; 

The first algorithm is designed for Illumina sequence reads up to 100 base
pairs, the other two for longer sequences ranged from 70bp to 1Mbp. BWA-MEM
and BWA-SW share similar features, such as long-read support and split
alignment, but BWA-MEM, which is the latest, is generally recommended for
high-quality queries as it is faster and more accurate. BWA-MEM also has
better performance than BWA-backtrack for 70-100bp Illumina reads.

##  Web Site:

The BWA home page at sourceforge.net:  
[ http://bio-bwa.sourceforge.net/ ](http://bio-bwa.sourceforge.net/)

##  Reference:

  * The BWA manual reference pages at sourceforge.net:  
[ http://bio-bwa.sourceforge.net/bwa.shtml ](http://bio-
bwa.sourceforge.net/bwa.shtml)

  * H Li, R Durbin,  
Fast and accurate short read alignment with Burrows-Wheeler Transform,  
Bioinformatics,  
Volume 25, pages 1754-1760, 2009.

  * H Li, R Durbin,  
Fast and accurate long-read alignment with Burrows-Wheeler Transform,  
Bioinformatics, Epub,  
2010\.

##  Usage:

On any ARC cluster, check the installation details by typing "module spider
bwa".

BWA requires that the appropriate modules be loaded before it can be used. One
version of the appropriate commands for use on NewRiver is:

    
    
    module purge
    module load gcc/5.2.0
    module load bwa/0.7.12
        

##  Examples:

The following batch file demonstrates the use of BWA:

    
    
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
    module load bwa/0.7.12
    #
    #  Index the reference genome.
    #
    bwa index dmel-all-chromosome-r5.37.fasta
    #
    #  Align the reads against the reference.
    #
    bwa aln -I -t 8 dmel-all-chromosome-r5.37.fasta read.fasta > out.sai
    #
    #  Convert the alignment into a SAM file.
    #
    bwa samse dmel-all-chromosome-r5.37.fasta out.sai read.fasta > out.sam
    

The database file dmel-all-chromosome-r5.37.fasta is too large to be
distributed through our example system. A PARTIAL set of files to carry out a
similar process are available in [a tar
file](https://secure.hosting.vt.edu/www.arc.vt.edu/wp-
content/uploads/2017/07/bwa_example.tar.gz)

