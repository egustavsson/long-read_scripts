# A collection of scripts used for long-read RNA seq analysis
**`LengthFilterFQ.sh`** - filter FASTQ based on min and max read length.

This script is run usng the following command: `$ ./LengthFilterFQ.sh -m [minLength] -M [maxLength]` 
Replace `[minLength]` with the desired minimum read length, and `[maxLength]` with the desired maximum read length.


**`filterGene.sh`** - filter filter GTF/GFF/GCT or similar tab-delimited files by gene of interest.
This script is run usng the following command: `./filterGene.sh -i input_file.gct.gz -o output_file.gct -g ENSG01` 
Replace `[minLength]` with the desired minimum read length, and `[maxLength]` with the desired maximum read length.
