#!/bin/bash

# This is a script to run STAR for paired end samples

# Path to the STAR genome index directory
GenomeDir="star_align/index"
Threads=38

## Passing variables
# Input directory
InputDir=$1
# Output directory
OutputDir=$2

# Create the output directory if it does not exist
mkdir -p "$OutputDir"

# Iterate over the trimmed R1 files
# R1 corresponds to run 1, and so these are the first of the paired reads
for R1 in "$InputDir"/*_R1_trimm.out; do
	# Derive the sample name and corresponding R2 file
	SampleName=$(basename "$R1" | sed 's/_R1_trimm.out//')
	# R2 rile is the second of each paired read
	R2="${InputDir}/${SampleName}_R2_trimm.out"
	# Check if the corresponding R2 file exists
	if [[ -e "$R2" ]]; then
		echo "Aligning sample $SampleName"
		# Run STAR for paired-end data
		STAR --runThreadN "$Threads" \
				--genomeDir "$GenomeDir" \
				--readFilesIn "$R1" "$R2" \
				--outFileNamePrefix "${OutputDir}/${SampleName}_" \
				--outSAMtype BAM SortedByCoordinate \
				--quantMode TranscriptomeSAM TranscriptomeSAM --limitBAMsortRAM 5915686153
	else
		echo "Missing R2 file for sample $SampleName, skipping alignment"
	fi
done
