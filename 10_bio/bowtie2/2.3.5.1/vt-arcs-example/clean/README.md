#  bowtie2

##  Introduction:

**BOWTIE2** is a tool for fast and sensitive sequencing read alignment.

BOWTIE2 is a fast, memory-efficient tool for aligning sequencing reads to long
reference sequences. It is especially good for aligning reads whose lengths
are from 50 to hundreds or thousands of characters. It is particularly good on
relatively long genomes, such as those of mammals.

BOWTIE2 indexes the genome with an FM Index to keep its memory footprint
small: thus, for the human genome, its memory footprint is typically around
3.2 GigaBytes. BOWTIE2 supports gapped, local, and paired-end alignment modes.

##  Web Site:

The BOWTIE2 web page at SourceForge: [ http://bowtie-
bio.sourceforge.net/bowtie2/index.shtml](http://bowtie-
bio.sourceforge.net/bowtie2/index.shtml)

##  Reference:

  * The BOWTIE2 online manual: [ http://bowtie-bio.sourceforge.net/bowtie2/manual.shtml ](http://bowtie-bio.sourceforge.net/bowtie2/manual.shtml)
  * The BOWTIE2 citation:  
Ben Langmead, Steven Salzberg,  
Fast gapped-read alignment with Bowtie 2,  
Nature Methods,  
Volume 9, pages 357-359, 2012.

##  Usage:

On any ARC cluster, check the installation details by typing "module spider
bowtie2".

BOWTIE2 requires that the appropriate modules be loaded before it can be used.
One version of the appropriate commands for use on NewRiver is:

    
    
    module purge
    module load gcc/5.2.0
    module load bowtie2/2.2.5
        

##  Examples:

The following batch file applies BOWTIE2 to data in a FASTQ file:

    
    
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
    module load bowtie2/2.2.5
    #
    bowtie2 -x e_coli -U sim_reads.fq -S sim_reads_aligned.sam 
    

A complete set of files to carry out a similar process are available in [a tar
file](https://secure.hosting.vt.edu/www.arc.vt.edu/wp-
content/uploads/2017/07/bowtie2_example.tar.gz)

