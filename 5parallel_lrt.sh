#!/bin/bash

#script to run the likelihood ratio test using each species in the foreground in parallel

TYPE=$1 #specify which model, branch or branchsite
DIR=$2 #directory containing codeml output directory

#for branch model
if [ ${TYPE} == "branch" ]; then
	for i in {"mm","ms","mc"}
	do	
		python /bigrock_home/tkang/paml2022/code/run_likelihoodratiotest.py ${DIR}${i}_lrt/ ${DIR}${i}_codeml_out/ ${i} &
	done

#for branchsite model
elif [ ${TYPE} == "branchsite" ]; then
	for i in {"mm","ms","mc"}
	do	
		#echo ${TYPE} ${i}
		python /bigrock_home/tkang/paml2022/code/run_BS_likelihoodratiotest.py ${DIR}branchsite/${i}_lrt/ ${DIR}branchsite/${i}_codeml_out/ ${i} &
	done
else
	echo "Invalid codeml type, please choose 'branch' or 'branchsite'."
fi

