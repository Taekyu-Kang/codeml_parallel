#!/bin/bash

#script to run codeml using each species in the foreground in parallel

TYPE=$1 #specify which model, branch or branchsite
DIR=$2 #directory containing phylip alignments

#for branch model
if [ ${TYPE} == "branch" ]; then 
	for i in {"mm","ms","mc"}
	do	
		python /bigrock_home/tkang/paml2022/code/run_codeml_on_directory.py ${DIR}phylip/ ${DIR}${i}_codeml_out/ ${i} &
	done

#for branchsite model
elif [ ${TYPE} == "branchsite" ]; then
	for i in {"mm","ms","mc"}
	do	
		python /bigrock_home/tkang/paml2022/code/run_BS_codeml_on_directory.py ${DIR}phylip/ ${DIR}branchsite/${i}_codeml_out/ ${i} &
	done
else
	echo "Invalid codeml type, please choose 'branch' or 'branchsite'."
fi

