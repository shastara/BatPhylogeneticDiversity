library(adegenet)
library(tools)
library(stringr)

#list all individuals from final alignment
l <- read.csv("COI_all_aligned_trimmed_Partition_1.csv", header=FALSE)
l <- data.frame(lapply(l, trimws), stringsAsFactors = FALSE)
names(l) <- c("phylogatr_id", "ASAP")
list <- as.list(l[,1])


#loop through all occurrence files to get GPS coordinates
myfiles <- list.files(pattern = "occurrences.txt", full.names=TRUE, recursive = TRUE)

keep_all <- data.frame()

for (f in myfiles) {
    
    #get species name
    sp <- str_split(f,"/")[[1]][6]
    sp <- sub("-", " ", sp)

    #import occurrence file to get GPS coordinates
    occurrences <- read.delim(f)
    occurrences <- cbind(sp,occurrences)
    
    keep <- occurrences[occurrences$phylogatr_id %in% list,]
    keep <- keep[, c(1,2,5,6)]
    keep_all <- rbind(keep_all, keep)
    
}

data_all <-merge(keep_all, l, by="phylogatr_id")
write.csv(data_all, file = "bat_GPS_spdelim.csv", row.names = F, quote = F)
