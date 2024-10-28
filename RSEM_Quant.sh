#!/bin/bash

# This is a script to run RSEM on aligned reads

Threads=38

## Passing variables
# Input directory
InputDir=$1
# Directory to of the RSEM genome index
RSEMGenomeDir=$2
# Output directory
OutputDir=$3

aligntype="toTranscriptome"

# Create the output directory if it does not exist
mkdir -p "${OutputDir}"

# Iterate over the aligned bam 
for R1 in "$InputDir"F1_Aligned.${aligntype}.out.bam; do
	# Derive the sample name
	SampleName=$(basename "$R1" | sed 's/_Aligned.'${aligntype}'.out.bam//')
	out=${OutputDir}/${SampleName}
	log=${OutputDir}/${SampleName}.log

	echo "Quantifying aligned read ${R1}"
	# Run RSEM
	rsem-calculate-expression -p 6 --paired-end --alignments \
		--estimate-rspd \
		--calc-ci \
		--ci-memory 32000 \
		--seed 123456 \
		--no-bam-output \
		${R1} ${RSEMGenomeDir}index ${out}> ${log} &
done 
