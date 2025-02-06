##pull 1 DNA sequence per ASAP partition

setwd()

bat <- read.csv("bat_GPS_spdelim.csv")

#list all unique ASAP #s

n <- unique(bat$ASAP)

library(microseq)
a <- readFasta("COI_all_aligned_trimmed.fas")

list = list()

for (i in n) {
  
  ids <- bat[bat$ASAP == i,]
  id <- sample(ids$phylogatr_id, 1)
  list[[length(list) + 1]] <- id
  
}

seqs <- a[a$Header %in% list,]

writeFasta(seqs, out.file = "COI_OTUs.fasta")



###OLD######################################
library (seqinr)
a <- read.fasta("COI_clean1_strict.fas")
seqs <- a[names(a) %in% list]