#!/bin/bash

#script to run through organized CDS sequences and return MUSCLE alignments

DIR=$1
OUTDIR=$2

for f in $DIR*.fa
do
	f1=${f%.fa} #grab file ID
	f2=${f1##*/}

	/bigrock_home/tkang/muscle_align/muscle3.8.31_i86linux64 -in "$f" -out ${OUTDIR}${f2}.muscle_afa -maxiters 2
done
