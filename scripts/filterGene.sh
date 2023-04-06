#!/bin/bash

helpFunction()
{
	echo ""
	echo "Usage: $0 -i input_file -o output_file -g gene_name"
	echo -e "\t-i input file name"
	echo -e "\t-o output file name"
	echo -e "\t-g gene name to filter on"
	exit 1
}

while getopts "i:o:g:" opt
do
	case "$opt" in
		i ) input_file="$OPTARG" ;;
		o ) output_file="$OPTARG" ;;
		g ) gene_name="$OPTARG" ;;
		? ) helpFunction ;;
	esac
done

if [ -z "$input_file" ] || [ -z "$output_file" ] || [ -z "$gene_name" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

if [[ $input_file == *.gz ]]; then
    zcat "$input_file" | awk -F "\t" -v gene="$gene_name" 'NR == 1 || $2 == gene {print}' > "$output_file"
else
    awk -F "\t" -v gene="$gene_name" 'NR == 1 || $2 == gene {print}' "$input_file" > "$output_file"
fi
