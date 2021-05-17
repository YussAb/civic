#R_SCRIPT TO MAKE CIVIC ANNOTATION ON MAF
#setwd("~/WORK/scons_training/scons_repo/oncokb")
oncokb <- read.delim2(file="npc_maf_oncokb.tsv")
#setwd("~/WORK/cancerdb/civic/civic_test")
civic <- read.delim2(file="civicTab.tsv")

head <- c("Start_Position","Tumor_Seq_Allele1", "Tumor_Seq_Allele2")


oncokb_work <- cbind.data.frame(oncokb$Start_Position, oncokb$Tumor_Seq_Allele1, oncokb$Tumor_Seq_Allele2)
civic_work <- cbind.data.frame(civic$POS, civic$REF, civic$ALT)


colnames(oncokb_work) <- head
colnames(civic_work) <- head

oncokb_civic <- merge(oncokb_work, civic_work, by = c("Tumor_Seq_Allele1", "Tumor_Seq_Allele2"))
