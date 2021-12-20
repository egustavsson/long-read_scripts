#!/bin/bash

helpFunction()
{
	echo ""
	echo "Usage: $0 -m minLength -M maxLength"
	echo -e "\t-m min read length"
	echo -e "\t-M max read length"
	exit 1
}

while getopts "m:M:" opt
do
	case "$opt" in
		m ) minLength="$OPTARG" ;;
		M ) maxLength="$OPTARG" ;;
		? ) helpFunction ;;
	esac
done

if [ -z "$minLength" ] || [ -z "$maxLength" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

awk 'BEGIN {FS = "\t" ; OFS = "\n"} {header = $0 ; getline seq ; getline qheader ; getline qseq ; if (length(seq) >= $minLength && length(seq) <= $maxLength) {print header, seq, qheader, qseq}}'
