#! /bin/bash

#REFERENCE 
#https://github.com/brentp/vcfanno
#https://github.com/fakedrtom/crab
echo "This script will annotate your vcf file using CiVIC"

vcf=$1
vcf_name="$(basename -- $vcf .vcf)"
##need to activate
##conda activate vcfanno

vcfanno civic.toml ${vcf}  > $vcf_name"_civic.vcf"

echo "The vcf file is now annotated"
