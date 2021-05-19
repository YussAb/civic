#! /bin/bash

#repository to download the vcf
#https://civicdb.org/releases

#wget https://civicdb.org/downloads/01-May-2021/01-May-2021-civic_accepted_and_submitted.vcf

#input_vcf="01-May-2021-civic_accepted_and_submitted.vcf"
input_vcf=$1
input_name="$(basename -- $input_vcf .vcf)"


#conda activate bioinfo

#the first step is to index and build the index
grep "^#" ${input_vcf} > $input_name"_sorted".vcf
grep -v "^#" ${input_vcf} | sort -k1,1V -k2,2g >> $input_name"_sorted.vcf"
bgzip $input_name"_sorted.vcf"
tabix $input_name"_sorted.vcf.gz"

echo "Now you can use"
echo '$input_name"_sorted.vcf.gz'
echo "to annotate your vcf"
echo "You can try using the files in ./example"

exit
###
###
#These steps will be part of civic2tab.sh
###
###


#then we applied a custom script to obtain a vcf with each distinct consequence
bgzip -d $input_name"_sorted.vcf.gz"
python3 civicDistinct.py -v $input_name"_sorted.vcf" > $input_name"_sorted_distinct.vcf"

#se voglio rimuovere l'errore di bcftools devo fare l'index per l'output di civicDistinct.py
#at this point we create a pipe separated file with bcftools 
bcftools query -f '%CHROM|%POS|%ID|%REF|%ALT|%QUAL|%FILTER|%INFO/CSQ\n' $input_name"_sorted_distinct.vcf" > $input_name"_sorted_distinct.txt"
echo "Ignore [W::vcf_parse] ... "
echo "If you want to eliminate the warning you need to index" $input_name"_sorted_distinct.vcf"

#and then we manipulate it with R
#bcftools +split-vep -l 01-May-2021-civic_accepted_and_submitted_sorted_distinct.vcf > header.txt
#add (CHROM,POS,ID,REF,ALT,QUAL,FILTER)

#!/usr/bin/Rscript
Rscript civicR.R




