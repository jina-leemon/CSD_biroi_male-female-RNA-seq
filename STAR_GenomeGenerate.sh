#!/bin/bash

# STAR command script for generating a genome index. This is required to be run before using STAR to align


# Number of threads to use
Threads=45
# Directory to store the STAR genome index
STARGenomeDir=$1
# Path to the genome fasta file
GenomeAssemblyFASTA="GenBank_biroi_genome.fasta"
# Path to the GTF file
GenomeAnnotationGTF="Refseq_With_Genbank_MT_And_ORs.gtf"

# Making sure the genome index directory exists
mkdir -p $STARGenomeDir

# Run STAR to generate the genome index
STAR --runThreadN $Threads \
	--runMode genomeGenerate \
	--genomeDir $STARGenomeDir \
	--genomeFastaFiles $GenomeAssemblyFASTA \
	--sjdbGTFfile $GenomeAnnotationGTF

