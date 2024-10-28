# CSDsexdiff
Male and female bulk RNA-seq data analysis for [link to paper]

## Necessary packages:
STAR
RSEM
HTSeq

## Alignment:
Make genome index with STAR_GenomeGenerate.sh
Align raw .bam reads to genome with index using STAR_GenomeAlign.sh.
This will generate two output .bam files, one aligned by coordinate and one aligned to the transcriptome.
The first one is used for differential exon usage analysis with DEXseq.

## Read quantification
Uuse RSEM_ref-transcriptome.sh to make an index and run RSEM_Quant.sh with the outputs aligned to transcriptome.
The resulting .genes.results files can be used for differential expression analysis with DESeq.
The R markdown files has steps to run this analysis.

## Differential exon usage DEXseq
For DEXSeq, python preprocessing is necessary and these scripts can be found in the DEXSeq documentation.
Run these scripts with DEXSeq_preprocess.sh and use the R markdown file for downstream analysis.
