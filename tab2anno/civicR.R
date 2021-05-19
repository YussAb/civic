#BRIEF SCRIPT TO PARSE AND NAME THE HEADER
#setwd("~/WORK/cancerdb/civic/civic_test")
#setwd(getSrcDirectory()[1])
#this.dir <- dirname(parent.frame(2)$ofile)
#setwd(this.dir)

civic <- read.delim2(file="01-May-2021-civic_accepted_and_submitted_sorted_distinct.txt", sep="|", header=F)
#civic_vcf_header <- c("CHROM", "POS", "ID", "REF", "ALT", "QUAL", "FILTER")
#civic_vcf_header <- data.frame(a=1:7,civic_vcf_header)
civic_csq_header <- read.delim2(file="header.txt", header=F)
colnames(civic) <- civic_csq_header$V2

write.table(civic , file="civicTab.tsv" , sep = "\t", row.names=FALSE)

