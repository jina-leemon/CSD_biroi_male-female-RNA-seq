#!/bin/bash

# STAR command script for generating a genome index. This is required to be run before using STAR to align

# Directory to store the RSEM genome index
RSEMGenomeDir=$1

# Path to FASTA file
GenomeAssemblyFASTA="/GenBank_biroi_genome.fasta"
# Path to the GTF file
GenomeAnnotationGTF="/obiro-gtf"

rsem-prepare-reference \
    --gtf ${GenomeAnnotationGTF} ${GenomeAssemblyFASTA} ${RSEMGenomeDir}index
