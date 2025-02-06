#get all OTU/tree per region data

library(tools)
library(phylotools)
library(sp)
library(rgdal)
library(dplyr)
library(stringr)
library(ape)


#import all ASAP and GPS data
g1 <- read.csv("bat_GPS_spdelim.csv")
g2 <- read.csv("bat_GPS_spdelim.csv")

#format coordinates
coordinates(g1) <- c("longitude", "latitude")
as(g1,"SpatialPoints")

proj4string(g1) <- CRS("+proj=longlat +datum=WGS84")

#import phylogenetic tree 
tree <- read.tree("COI_OTUs_withSP_final.fasta.raxml.bestTree") 

#set up community matrix 
tree$tip.label <- gsub("\\..*","",tree$tip.label) 
tips <- tree$tip.label 


### Loop through this list/column and remove the sp names?
samp <- data.frame(matrix(nrow = 0, ncol = length(tips)), check.names = F)
names(samp) <- tips
temp_names <- list()

#loop through all polygons to get PD from each region
myfiles <- list.files(path = "polys", pattern = ".shp", full.names=TRUE)

for (p in myfiles){

poly <- readOGR(p)

p_name <- basename(p)
p_name <- file_path_sans_ext(p_name)
temp_names[p] <- p_name

pointsinpoly <- over(g1,poly)

d <- which(!is.na(pointsinpoly))

m <- g2[c(d),]

#get all ASAP group numbers and species names
OTUs <- unique(m$ASAP)
OTU_n <- length(OTUs)
species <- unique(m$sp)
species_n <- length(species)

#get tip IDs for all ASAP groups in list
all <-  as.data.frame(g2[g2$ASAP %in% OTUs,])
IDs <- all$phylogatr_id
IDs <- str_replace(IDs,'-','N')

#prune tree
pruned.tree <- drop.tip(tree, tree$tip.label[-na.omit(match(IDs, tree$tip.label))])
#write.tree(pruned.tree, file=paste(p_name,".tre",sep=""))

#get info to export to matrix
OTU_IDs <- pruned.tree$tip.label

#new list
temp <- list()

#code 0 and 1 is that OTU is in region
  for (i in colnames(samp)){
    temp[i] <- ifelse(i %in% OTU_IDs, 1, 0)
  }

samp <- rbind (samp, temp)
names(samp) <- tips

write.table(data.frame(p_name, OTU_n, species_n), file="OTU_geo_summary.csv", quote=FALSE, row.names=FALSE, col.names=!file.exists("OTU_geo_summary.csv"), append=TRUE, sep=",")

}

#add rownames to matrix
row.names(samp) <- temp_names

write.csv(samp, file="community_matrix.csv", quote=FALSE)


#######################################################################################
#phylogenetic diversity estimates
library(ape)
library(picante)

#import files
tree <- read.tree("COI_OTUs_withSP_final.fasta.raxml.bestTree")
tree$tip.label <- gsub("\\..*","",tree$tip.label) 
samp <- read.csv("community_matrix.csv", check.names = F)


#Faith's PD
pd <- pd(samp, tree, include.root=FALSE)
l <- lm(pd$SR ~ pd$PD)
summary(l)

#other PDs
mntd <- mntd(samp[,-1], cophenetic(tree))
mpd <- mpd(samp[,-1], cophenetic(tree))

pd <- cbind(pd,mntd)
pd <- cbind(pd,mpd)

l <- lm(pd$SR ~ pd$mntd)
summary(l)

l <- lm(pd$SR ~ pd$mpd)
summary(l)

#write results to file
eco <- samp[,1]
pd <- cbind(pd, eco)
write.csv(pd, file="pd.csv", quote=FALSE, row.names = F)

##################################################
#dist matrix
dna <- read.fasta("COI_pruned_trimmed.fasta")
dna_dist <- cophenetic.phylo(tree)
write.csv(dna_dist, file="distance_matrix.csv", quote=FALSE)
