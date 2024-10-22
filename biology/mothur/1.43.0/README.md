Running Test Batches:

1. Download `TestReferences` and `TestFiles` from XXX and put in same location as mothur executable
2. Download mothur's external programs: `vsearch`, `uchime` and `blast`. Available with mothur's executable versions
3. Run an individual batch test:

```bash 
    sarahwestcott$ cd mothur_test_batches
    mothur_test_batches sarahwestcott$ ls
    TestFiles    align.seqs    blast        formatdb.log    uchime
    TestReferences    biom.info    classify.seqs    mothur        vsearch
    ...
    mothur_test_batches sarahwestcott$ ./mothur "./align.seqs/batch"

    Output to screen will look like:

    mothur > set.dir(input=./TestFiles, output=./align.seqs, tempdefault=./TestReferences)
    Mothur's directories:
    outputDir=/Users/sarahwestcott/Desktop/mothur_test_batches/align.seqs/
    inputDir=/Users/sarahwestcott/Desktop/mothur_test_batches/TestFiles/
    tempDefault=/Users/sarahwestcott/Desktop/mothur_test_batches/TestReferences/

    mothur > set.logfile(name=alignseqs.logfile)
    ...
```
