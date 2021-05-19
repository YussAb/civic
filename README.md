# CIVIC ANNOTATOR

* As a first step you need to download the vcf from civic repo
    * wget https://civicdb.org/downloads/01-May-2021/01-May-2021-civic_accepted_and_submitted.vcf

* Then we run 
    * civicPreprocess.sh [01-May-2021-civic_accepted_and_submitted.vcf] 

* Thew you need to activate conda and install vcfanno
    * civicAnnotator.sh [example/tumor_sample.BRCA.vcf.gz]

* You'll find the annotation at tumor_sample.BRCA.vcf.gz_civic.vcf
