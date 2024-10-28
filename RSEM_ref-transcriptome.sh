#!/bin/bash

# STAR command script for generating a genome index. This is required to be run before using STAR to align

# Directory to store the RSEM genome index
RSEMGenomeDir=$1

# Path to FASTA file
GenomeAssemblyFASTA="/home/antqueen/booster/KDL20240123_STARprepForJina/data/Genome/GenBank_biroi_genome.fasta"
# Path to the GTF file
#GenomeAnnotationGTF="/home/antqueen/booster/KDL20240123_STARprepForJina/data/Genome/RefSeq_With_GenBank_MT_And_ORs.gtf"
GenomeAnnotationGTF="/home/antqueen/booster/JL20240124_FemaleMaleRNAseqDifferential/stringtie_m/Refseq_With_Genbank_MT_And_ORs_m_fin.gtf"

rsem-prepare-reference \
    --gtf ${GenomeAnnotationGTF} ${GenomeAssemblyFASTA} ${RSEMGenomeDir}index