library(stringr)
library(dplyr)

#Script to help quantify ASAP results. Records all the matched,
#  split, and merged species in ASAP results.

#set working directory

#import data
ASAP <- read.csv("bat_GPS_spdelim.csv")


### Create lists of possible split and matched species ###

#get a unique list of species names
unique_sp <- unique(ASAP$sp)

write.csv(unique_sp, file = "uniqueSp.csv", row.names = F, quote = F)

#create an empty data frame to collect split species
split <- data.frame()
#create an empty data frame to collect possible matched species
matched_sp1 <- data.frame()

#for all species
for (sp in unique_sp){
  df <- data.frame()
  #loop through all the rows in the ASAP file
  for (i in 1:nrow(ASAP))
  {
    current <- ASAP[i, "sp"]
    #find all rows with that species
    if (current == sp)
    {
      df <- rbind(df, ASAP[i,])
    }
  }
  #find all the unique ASAP numbers for that species
  u <- unique(df$ASAP)
  #if it is part of more than one asap group
  if (length(u) > 1)
  {
    sp_groups <- data.frame(sp, u)
    #add it to the list of split species with its group numbers
    split <- bind_rows(split, sp_groups)
  }
  #if it is only part of one asap group
  if (length(u) == 1)
  {
    #add it to the list of possible matched species
    matched_sp1 <- rbind(matched_sp1, df[1,])
  }
}

#change column names
colnames(split)[2] = "ASAP"

#write split list to file
write.csv(split, file = "split.csv", row.names = F, quote = F)



### Create a list of possible merged groups ###

#get a unique list of ASAP groups
unique_group <- unique(ASAP$ASAP)

#create an empty data frame to collect merged species
merged <- data.frame()
#create an empty data frame to collect possible matched species
matched_sp2 <- data.frame()

#for all ASAP groups
for (group in unique_group) {
  df <- data.frame()
  for (i in 1:nrow(ASAP))
  {
    current <- ASAP[i, "ASAP"]
    #find all rows with that group
    if (current == group)
    {
      df <- rbind(df, ASAP[i,])
    }
  }
  #find all the unique species for that group
  u <- unique(df$sp)
  #if the group has more than one species
  if (length(u) > 1)
  {
    group_sp <- data.frame(group, u)
    #add it to the list of merged groups
    merged <- bind_rows(merged, group_sp)
  }
  #if it only has one species
  if (length(u) == 1)
  {
    #add it to the list of possible matched species
    matched_sp2 <- rbind(matched_sp2, df[1,])
  }
}

#swap and rename columns
merged <- merged[c("u", "group")]
colnames(merged)[1] = "sp"
colnames(merged)[2] = "ASAP"

#write merged list to file
write.csv(merged, file = "merged.csv", row.names = F, quote = F)






#create an empty data frame to collect definite matched species
matched <- data.frame()

#Determine which species are definitely matched
#for all the species in matched_sp1
for (i in 1:nrow(matched_sp1)){
  #loop through all rows in the second matched species list
  for (j in 1:nrow(matched_sp2))
  {
    #if the species for that row is in both lists
    if (matched_sp1[i, "sp"] == matched_sp2[j, "sp"]){
      #the species is matched, add it to the definite matched list
      matched <- rbind(matched, matched_sp1[i,])
      break
    }
  }
}

#get rid of extra columns
matched <- subset(matched, select = -c(phylogatr_id,latitude,longitude))

#write list to file
write.csv(matched, file = "matched.csv", row.names = F, quote = F)



#Determine which species are split-merged
#import data
merged <- read.csv("merged.csv")
split <- read.csv("split.csv")

#create an empty dataframe for list of split-merged species
split_merged <- data.frame()

#loop through all the species in the merged dataframe
for (sp1 in unique(merged$sp)){
  for (sp2 in split$sp){
    #if the species is also in the split dataframe
    if (sp1 == sp2){
      #add it to the split_merged file
      split_merged <- rbind(split_merged, sp1)
      #move on to the next species
      break
    }
  }
}

#write split_merged data to a csv file
write.csv(split_merged, file = "split-merged.csv", row.names = F, quote = F)
