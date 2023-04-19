# Useful Long-Read RNA-Seq Analysis Scripts

This repository contains a collection of scripts used for long-read RNA-seq data analysis. The scripts are designed to perform various tasks such as filtering FASTQ files based on read length and filtering GTF/GFF/GCT or similar tab-delimited files by genes of interest.

## Script Descriptions

### LengthFilterFQ.sh

`LengthFilterFQ.sh` is used to filter FASTQ files based on minimum and maximum read length.

Usage: 
```
$ ./LengthFilterFQ.sh -m [minLength] -M [maxLength]
```
Replace [minLength] with the desired minimum read length, and [maxLength] with the desired maximum read length.

### filterGene.sh

`filterGene.sh` is used to filter GTF/GFF/GCT or similar tab-delimited files by gene of interest.

Usage:
```
$ ./filterGene.sh -i [input_file] -o [output_file] -g [gene_id]
```
Replace [input_file] with your input file (either .gz or not), [output_file] with the output file name, and [gene_id] with the desired Ensembl gene ID.

### filterGeneFromFile.sh

`filterGeneFromFile.sh` does the same thing as `filterGene.sh` but takes a tab-delimited file with gene ids as input.

Usage:
```
$ ./filterGeneFromFile.sh -i [input_file] -o [output_file] -g [gene_id_file]
```
Replace [input_file] with your input file (either .gz or not), [output_file] with the output file name, and [gene_id_file] with the desired Ensembl gene ID in a tab-delimited file.

### getClinVarForLoci.sh

`getClinVarForLoci.sh` is used to download and filter ClinVar VCF file by chromosome, start and end positions.

Usage:
```
$ ./getClinVarForLoci.sh -d [directory] -c [chromosome] -s [start_position] -e [end_position] -u [download_url]
```
Replace [directory] with the output directory path, by default it uses the current directory. Replace [chromosome] with the desired chromosome number, [start_position] with the desired start position and [end_position] with the desired end position. Replace [download_url] with the desired ClinVar VCF download URL, by default it uses the latest version from https://ftp.ncbi.nlm.nih.gov/pub/clinvar/vcf_GRCh38/.

Note: By default, the script downloads the ClinVar VCF file for GRCh38 assembly from the NCBI FTP server. If you want to use a different VCF file, specify its download URL with the -u option.
