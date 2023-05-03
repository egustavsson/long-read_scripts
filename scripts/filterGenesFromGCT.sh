#!/bin/bash

helpFunction()
{
	echo ""
	echo "Usage: $0 -i input_file -o output_file -g gene_id_file"
	echo -e "\t-i input file name"
	echo -e "\t-o output file name"
	echo -e "\t-g tab-delimited gene id file to filter on"
	exit 1
}

while getopts "i:o:g:" opt
do
	case "$opt" in
		i ) input_file="$OPTARG" ;;
		o ) output_file="$OPTARG" ;;
		g ) gene_id_file="$OPTARG" ;;
		? ) helpFunction ;;
	esac
done

if [ -z "$input_file" ] || [ -z "$output_file" ] || [ -z "$gene_id_file" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

if [[ $input_file == *.gz ]]; then
    zcat "$input_file" | awk -F "\t" -v gene_id_file="$gene_id_file" 'BEGIN{ while((getline gene < gene_id_file) > 0) gene_id[gene] = 1 } NR <= 3 || ($2 in gene_id) {print}' > "$output_file"
else
    awk -F "\t" -v gene_id_file="$gene_id_file" 'BEGIN{ while((getline gene < gene_id_file) > 0) gene_id[gene] = 1 } NR <= 3 || ($2 in gene_id) {print}' "$input_file" > "$output_file"
fi
