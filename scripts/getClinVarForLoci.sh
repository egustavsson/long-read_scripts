#!/bin/bash

# Set default values
directory="."
download_url="https://ftp.ncbi.nlm.nih.gov/pub/clinvar/vcf_GRCh38/clinvar.vcf.gz"

# Parse command line options
while getopts "d:c:s:e:u:" opt; 
do
  case $opt in
    d) directory=$OPTARG ;;
    c) chr=$OPTARG ;;
    s) start=$OPTARG ;;
    e) end=$OPTARG ;;
    u) download_url=$OPTARG ;;
    *)
      echo "Invalid option: -$opt" >&2
      exit 1
      ;;
  esac
done

# Download file
wget -O "$directory/clinvar.vcf.gz" "$download_url"

# Filter vcf file using tabix
tabix -p vcf "clinvar.vcf.gz"

tabix "clinvar.vcf.gz" "$chr:$start-$end" > "$directory/filtered.vcf.gz"

tabix -p vcf "$directory/filtered.vcf.gz"
