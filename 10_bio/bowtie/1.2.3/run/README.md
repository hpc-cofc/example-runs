#  bowtie

##  Introduction:

**BOWTIE** is a tool for fast and sensitive sequencing read alignment.

BOWTIE is is an ultrafast, memory-efficient short read aligner. It aligns
short DNA sequences (reads) to the human genome at a rate of over 25 million
35-base pair reads per hour. BOWTIE indexes the genome with a Burrows-Wheeler
index to keep its memory footprint small: typically about 2.2 GigaBytes for
the human genome or 2.9 GigaBytes for paired-ends.

##  Web Site:

The BOWTIE web page at SourceForge: [ http://bowtie-
bio.sourceforge.net/index.shtml](http://bowtie-
bio.sourceforge.net/index.shtml)

##  Reference:

  * The BOWTIE online manual:  
[ http://bowtie-bio.sourceforge.net/manual.shtml ](http://bowtie-
bio.sourceforge.net/manual.shtml)

  * The BOWTIE citation:  
Ben Langmead, Cole Trapnell, Mihai Pop, Steven Salzberg,  
Ultrafast and memory-efficient alignment of short DNA sequences to the human
genome,  
Genome Biology,  
Volume 10:R25, 2009.

##  Usage:

On any ARC cluster, check the installation details by typing "module spider
bowtie".

BOWTIE requires that the appropriate modules be loaded before it can be used.
One version of the appropriate commands for use on NewRiver is:

    
    
    module purge
    module load gcc/5.2.0
    module load bowtie/1.1.2
        

##  Examples:

The following batch file applies BOWTIE to data in a FASTQ file:

    
    
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
    module load bowtie/1.1.2
    #
    bowtie -t e_coli e_coli_1000.fq e_coli.map
    #
    echo "Normal end of execution."
    

A complete set of files to carry out a similar process are available in [a tar
file](https://secure.hosting.vt.edu/www.arc.vt.edu/wp-
content/uploads/2017/07/bowtie_example.tar.gz)

