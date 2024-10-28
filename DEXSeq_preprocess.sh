#!/bin/bash
echo "$0 $@"
printf "started: "
date '+%Y-%m-%d %H:%M:%S'

pathpython="dexseq/"
inputgtf="Refseq_With_Genbank_MT_And_ORs_m_fin.gtf"
dexseqgtf="RefSeq_With_GenBank_MT_And_ORs_m_dexseq.gtf"
bamfiles="star_align/*Aligned.sortedByCoord.out.bam"
suffix="novelm_mtor_r"

if [ ! -f $dexseqgtf ]; then
    python $pathpython"dexseq_prepare_annotation.py" $inputgtf $dexseqgtf
    echo "$0 $@" 
fi


for file in $bamfiles; do
	# Derive the sample name and corresponding R2 file
	samplename=$(basename "$file" | sed 's/Aligned.sortedByCoord.out.bam//')
    printf $samplename
    printf "\n"
    python $pathpython"dexseq_count.py" -p yes -s reverse -r pos -f bam $dexseqgtf $file $pathpython$samplename$suffix"fb.txt" &
    echo "$0 $@" 
done

wait
printf "ended: "
date '+%Y-%m-%d %H:%M:%S'
printf "\n"