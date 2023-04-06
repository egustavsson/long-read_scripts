# Useful Long-Read RNA-Seq Analysis Scripts

This repository contains a collection of scripts used for long-read RNA-seq data analysis. The scripts are designed to perform various tasks such as filtering FASTQ files based on read length and filtering GTF/GFF/GCT or similar tab-delimited files by gene of interest.

## Script Descriptions

**`LengthFilterFQ.sh`**

This script is used to filter FASTQ files based on minimum and maximum read length.

Usage: 
```
$ ./LengthFilterFQ.sh -m [minLength] -M [maxLength]
```
Replace [minLength] with the desired minimum read length, and [maxLength] with the desired maximum read length.

**`filterGene.sh`**

This script is used to filter GTF/GFF/GCT or similar tab-delimited files by gene of interest.

Usage:
```
$ ./filterGene.sh -i [input_file] -o [output_file] -g [gene_id]
```
Replace [input_file] with your input file (either .gz or not), [output_file] with the output file name, and [gene_id] with the desired Ensembl gene ID.
