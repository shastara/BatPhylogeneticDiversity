library(randomForest)
library(dplyr)

#list variables to remove that are highly correlated 
#do three rounds of random forest, one for each

#import data
variable_data <- read.csv("mergedfile_superfam.csv")

bec <- read.csv("bat_env_corr.csv")

var.9 <- bec[which(bec$cor >= 0.9 | bec$cor <= -0.9),]
var.9 <- unique(var.9$column)

var.8 <- bec[which(bec$cor >= 0.8 | bec$cor <= -0.8),]
var.8 <- unique(var.8$column)

var.7 <- bec[which(bec$cor >= 0.7 | bec$cor <= -0.7),]
var.7 <- unique(var.7$column)

#subset bat_env_geo file for the 0.9 cutoff
var.9_mntd_data <- subset(variable_data, select = -c(Ecoregion,PD,SR,mpd))
var.9_mntd_data <- var.9_mntd_data[ , !names(var.9_mntd_data) %in% var.9]
var.9_mpd_data <- subset(variable_data, select = -c(Ecoregion,PD,SR,mntd))
var.9_mpd_data <- var.9_mpd_data[ , !names(var.9_mpd_data) %in% var.9]

#subset bat_env_geo file for the 0.8 cutoff
#var.8_data <- subset(variable_data, select = -c(PD,SR,mpd))
var.8_mntd_data <- subset(variable_data, select = -c(Ecoregion,PD,SR,mpd))
var.8_mntd_data <- var.8_mntd_data[ , !names(var.8_mntd_data) %in% var.8]
var.8_mpd_data <- subset(variable_data, select = -c(Ecoregion,PD,SR,mntd))
var.8_mpd_data <- var.8_mpd_data[ , !names(var.8_mpd_data) %in% var.8]

#subset bat_env_geo file for the 0.7 cutoff
#var.7_data <- subset(variable_data, select = -c(PD,SR,mpd))
var.7_mntd_data <- subset(variable_data, select = -c(Ecoregion,PD,SR,mpd))
var.7_mntd_data <- var.7_mntd_data[ , !names(var.7_mntd_data) %in% var.7]
var.7_mpd_data <- subset(variable_data, select = -c(Ecoregion,PD,SR,mntd))
var.7_mpd_data <- var.7_mpd_data[ , !names(var.7_mpd_data) %in% var.7]

### RANDOM FOREST ###

#0.9 Cutoff
RF_mntd_0.9 <- randomForest(mntd ~ ., data = var.9_mntd_data, importance=TRUE, ntree=1000, replace=T)
RF_mpd_0.9 <- randomForest(mpd ~ ., data = var.9_mpd_data, importance=TRUE, ntree=1000, replace=T)
RF_mpd_0.9
RF_mntd_0.9

#0.8 Cutoff
RF_mntd_0.8 <- randomForest(mntd ~ ., data = var.8_mntd_data, importance=TRUE, ntree=1000, replace=T)
RF_mpd_0.8 <- randomForest(mpd ~ ., data = var.8_mpd_data, importance=TRUE, ntree=1000, replace=T)
RF_mpd_0.8
RF_mntd_0.8

#0.7 Cutoff
RF_mntd_0.7 <- randomForest(mntd ~ ., data = var.7_mntd_data, importance=TRUE, ntree=1000, replace=T)
RF_mpd_0.7 <- randomForest(mpd ~ ., data = var.7_mpd_data, importance=TRUE, ntree=1000, replace=T)
RF_mpd_0.7
RF_mntd_0.7

#export importance measures
write.csv(importance(RF_mntd_0.9), file="imp0.9-mntd.csv")
write.csv(importance(RF_mpd_0.9), file="imp0.9-mpd.csv")
write.csv(importance(RF_mntd_0.8), file="imp0.8-mntd.csv")
write.csv(importance(RF_mpd_0.8), file="imp0.8-mpd.csv")
write.csv(importance(RF_mntd_0.7), file="imp0.7-mntd.csv")
write.csv(importance(RF_mpd_0.7), file="imp0.7-mpd.csv")


#################### Variable Groupings ####################

#subset variable data for the Geo group (pink)
geo_data <- variable_data[,1:14]
#subset variable data for the current bio group (blue)
curr_bio <- variable_data[,1:52]
curr_bio <- curr_bio[,-(6:14)]
#subset variable data for the misc group (gray)
misc_data <- variable_data[,1:88]
misc_data <- misc_data[,-(6:52)]

#subset variable data for LGM group (orange)
LGM_data <- cbind(variable_data[,1:5], variable_data %>% dplyr::select(contains("LGM")))
#subset variable data for LIG group (green)
LIG_data <- cbind(variable_data[,1:5], variable_data %>% dplyr::select(contains("LIG")))
#subset variable data for Plio group (yellow)
Plio_data <- cbind(variable_data[,1:5], variable_data %>% dplyr::select(contains("Plio")))

### Random Forest ###

#geo variables
RF_mntd_geo <- randomForest(geo_data[,6:14], geo_data$mntd, importance=TRUE, ntree=1000, replace=T)
RF_mpd_geo <- randomForest(geo_data[,6:14], geo_data$mpd, importance=TRUE, ntree=1000, replace=T)
write.csv(importance(RF_mntd_geo), file="imp_mntd_geo.csv")
write.csv(importance(RF_mpd_geo), file="imp_mpd_geo.csv")
RF_mpd_geo
RF_mntd_geo

#Current bio variables
RF_mntd_curr_bio <- randomForest(curr_bio[,6:43], curr_bio$mntd, importance=TRUE, ntree=1000, replace=T)
RF_mpd_curr_bio <- randomForest(curr_bio[,6:43], curr_bio$mpd, importance=TRUE, ntree=1000, replace=T)
write.csv(importance(RF_mntd_curr_bio), file="imp_mntd_curr_bio.csv")
write.csv(importance(RF_mpd_curr_bio), file="imp_mpd_curr_bio.csv")
RF_mpd_curr_bio
RF_mntd_curr_bio

#Misc variables
RF_mntd_misc <- randomForest(misc_data[,6:41], misc_data$mntd, importance=TRUE, ntree=1000, replace=T)
RF_mpd_misc <- randomForest(misc_data[,6:41], misc_data$mpd, importance=TRUE, ntree=1000, replace=T)
write.csv(importance(RF_mntd_misc), file="imp_mntd_misc.csv")
write.csv(importance(RF_mpd_misc), file="imp_mpd_misc.csv")
RF_mpd_misc
RF_mntd_misc

#LGM variables
RF_mntd_LGM <- randomForest(LGM_data[,6:62], LGM_data$mntd, importance=TRUE, ntree=1000, replace=T)
RF_mpd_LGM <- randomForest(LGM_data[,6:62], LGM_data$mpd, importance=TRUE, ntree=1000, replace=T)
write.csv(importance(RF_mntd_LGM), file="imp_mntd_LGM.csv")
write.csv(importance(RF_mpd_LGM), file="imp_mpd_LGM.csv")
RF_mpd_LGM 
RF_mntd_LGM 

#LIG variables
RF_mntd_LIG <- randomForest(LIG_data[,6:62], LIG_data$mntd, importance=TRUE, ntree=1000, replace=T)
RF_mpd_LIG <- randomForest(LIG_data[,6:62], LIG_data$mpd, importance=TRUE, ntree=1000, replace=T)
write.csv(importance(RF_mntd_LIG), file="imp_mntd_LIG.csv")
write.csv(importance(RF_mpd_LIG), file="imp_mpd_LIG.csv")
RF_mpd_LIG 
RF_mntd_LIG 

#Plio variables
RF_mntd_Plio <- randomForest(Plio_data[,6:47], Plio_data$mntd, importance=TRUE, ntree=1000, replace=T)
RF_mpd_Plio <- randomForest(Plio_data[,6:47], Plio_data$mpd, importance=TRUE, ntree=1000, replace=T)
write.csv(importance(RF_mntd_Plio), file="imp_mntd_Plio.csv")
write.csv(importance(RF_mpd_Plio), file="imp_mpd_Plio.csv")
RF_mpd_Plio
RF_mntd_Plio

#################### Variable Groupings with 0.9 Cutoff ####################

#subset variable data for the Geo group (pink)
geo.9_mntd_data <- var.9_mntd_data[,1:6]
geo.9_mpd_data <- var.9_mpd_data[,1:6]
#subset variable data for the current bio group (blue)
curr_bio.9_mntd_data <- var.9_mntd_data[,1:29]
curr_bio.9_mntd_data <- curr_bio.9_mntd_data[,-(2:6)]
curr_bio.9_mpd_data <- var.9_mpd_data[,1:29]
curr_bio.9_mpd_data <- curr_bio.9_mpd_data[,-(2:6)]
#subset variable data for the misc group (gray)
misc.9_mntd_data <- var.9_mntd_data[,1:58]
misc.9_mntd_data <- misc.9_mntd_data[,-(2:29)]
misc.9_mpd_data <- var.9_mpd_data[,1:58]
misc.9_mpd_data <- misc.9_mpd_data[,-(2:29)]

#subset variable data for LGM group (orange)
LGM.9_mntd_data <- cbind(var.9_mntd_data$mntd, var.9_mntd_data %>% dplyr::select(contains("LGM")))
LGM.9_mpd_data <- cbind(var.9_mpd_data$mpd, var.9_mpd_data %>% dplyr::select(contains("LGM")))
colnames(LGM.9_mntd_data)[1] = "mntd"
colnames(LGM.9_mpd_data)[1] = "mpd"

#subset variable data for LIG group (green)
LIG.9_mntd_data <- cbind(var.9_mntd_data$mntd, var.9_mntd_data %>% dplyr::select(contains("LIG")))
LIG.9_mpd_data <- cbind(var.9_mpd_data$mpd, var.9_mpd_data %>% dplyr::select(contains("LIG")))
colnames(LIG.9_mntd_data)[1] = "mntd"
colnames(LIG.9_mpd_data)[1] = "mpd"

#subset variable data for Plio group (yellow)
Plio.9_mntd_data <- cbind(var.9_mntd_data$mntd, var.9_mntd_data %>% dplyr::select(contains("Plio")))
Plio.9_mpd_data <- cbind(var.9_mpd_data$mpd, var.9_mpd_data %>% dplyr::select(contains("Plio")))
colnames(Plio.9_mntd_data)[1] = "mntd"
colnames(Plio.9_mpd_data)[1] = "mpd"

### Random Forest ###

#geo variables
RF_mntd_geo.9 <- randomForest(mntd ~ ., data = geo.9_mntd_data, importance=TRUE, ntree=1000, replace=T)
RF_mpd_geo.9 <- randomForest(mpd ~ ., data = geo.9_mpd_data, importance=TRUE, ntree=1000, replace=T)
write.csv(importance(RF_mntd_geo.9), file="imp_mntd_geo.9.csv")
write.csv(importance(RF_mpd_geo.9), file="imp_mpd_geo.9.csv")
RF_mpd_geo.9
RF_mntd_geo.9

#current bio variables
RF_mntd_curr_bio.9 <- randomForest(mntd ~ ., data = curr_bio.9_mntd_data, importance=TRUE, ntree=1000, replace=T)
RF_mpd_curr_bio.9 <- randomForest(mpd ~ ., data = curr_bio.9_mpd_data, importance=TRUE, ntree=1000, replace=T)
write.csv(importance(RF_mntd_curr_bio.9), file="imp_mntd_curr_bio.9.csv")
write.csv(importance(RF_mpd_curr_bio.9), file="imp_mpd_curr_bio.9.csv")
RF_mpd_curr_bio.9
RF_mntd_curr_bio.9

#misc variables
RF_mntd_misc.9 <- randomForest(mntd ~ ., data = misc.9_mntd_data, importance=TRUE, ntree=1000, replace=T)
RF_mpd_misc.9 <- randomForest(mpd ~ ., data = misc.9_mpd_data, importance=TRUE, ntree=1000, replace=T)
write.csv(importance(RF_mntd_misc.9), file="imp_mntd_misc.9.csv")
write.csv(importance(RF_mpd_misc.9), file="imp_mpd_misc.9.csv")
RF_mpd_misc.9
RF_mntd_misc.9

#LGM variables
RF_mntd_LGM.9 <- randomForest(LGM.9_mntd_data[,2:20], LGM.9_mntd_data$mntd, importance=TRUE, ntree=1000, replace=T)
RF_mpd_LGM.9 <- randomForest(LGM.9_mpd_data[,2:20], LGM.9_mpd_data$mpd, importance=TRUE, ntree=1000, replace=T)
write.csv(importance(RF_mntd_LGM.9), file="imp_mntd_LGM.9.csv")
write.csv(importance(RF_mpd_LGM.9), file="imp_mpd_LGM.9.csv")
RF_mpd_LGM.9
RF_mntd_LGM.9

#LIG variables
RF_mntd_LIG.9 <- randomForest(LIG.9_mntd_data[,2:17], LIG.9_mntd_data$mntd, importance=TRUE, ntree=1000, replace=T)
RF_mpd_LIG.9 <- randomForest(LIG.9_mpd_data[,2:17], LIG.9_mpd_data$mpd, importance=TRUE, ntree=1000, replace=T)
write.csv(importance(RF_mntd_LIG.9), file="imp_mntd_LIG.9.csv")
write.csv(importance(RF_mpd_LIG.9), file="imp_mpd_LIG.9.csv")
RF_mpd_LIG.9
RF_mntd_LIG.9

#Plio variables
RF_mntd_Plio.9 <- randomForest(Plio.9_mntd_data[,2:10], Plio.9_mntd_data$mntd, importance=TRUE, ntree=1000, replace=T)
RF_mpd_Plio.9 <- randomForest(Plio.9_mpd_data[,2:10], Plio.9_mpd_data$mpd, importance=TRUE, ntree=1000, replace=T)
write.csv(importance(RF_mntd_Plio.9), file="imp_mntd_Plio.9.csv")
write.csv(importance(RF_mpd_Plio.9), file="imp_mpd_Plio.9.csv")
RF_mpd_Plio.9
RF_mntd_Plio.9

#################### Random Forest with Top Variables ####################

top_mpd_data <- subset(variable_data, select = c(mpd, lon_mean, scd_sd, bio8_mean, bio1_mean, 
                                                 bio8_LGM_mean, bio2_LIG_diff, bio8_LIG_mean,
                                                 bio10_Plio_diff, bio8_Plio_diff, bio4_Plio_diff))

top_mntd_data <- subset(variable_data, select = c(mntd,lat_mean, lon_mean, area, scd_sd, bio8_mean, 
                                                  bio8_LGM_mean, bio1_LGM_diff, fl_risk_mean, 
                                                  bio8_LIG_diff, bio10_Plio_diff, bio8_Plio_diff,
                                                  bio4_Plio_diff, bio1_Plio_diff, globCover_mean))

RF_mntd_top <- randomForest(mntd ~ ., data = top_mntd_data, importance=TRUE, ntree=1000, replace=T)
RF_mpd_top <- randomForest(mpd ~ ., data = top_mpd_data, importance=TRUE, ntree=1000, replace=T)
write.csv(importance(RF_mpd_top), file="imp_mpd_top.csv")
write.csv(importance(RF_mntd_top), file="imp_mntd_top.csv")




#################### 215 Random Forest ####################

#import data
variable_data <- read.csv("mergedfile-215.csv")

variable_data <- na.omit(variable_data)

bec <- read.csv("bat_env_corr_215.csv")

var.9 <- bec[which(bec$cor >= 0.9 | bec$cor <= -0.9),]
var.9 <- unique(var.9$column)

var.8 <- bec[which(bec$cor >= 0.8 | bec$cor <= -0.8),]
var.8 <- unique(var.8$column)

var.7 <- bec[which(bec$cor >= 0.7 | bec$cor <= -0.7),]
var.7 <- unique(var.7$column)

#subset bat_env_geo file for the 0.9 cutoff
var.9_mntd_data <- subset(variable_data, select = -c(Ecoregion,PD,SR,mpd))
var.9_mntd_data <- var.9_mntd_data[ , !names(var.9_mntd_data) %in% var.9]
var.9_mpd_data <- subset(variable_data, select = -c(Ecoregion,PD,SR,mntd))
var.9_mpd_data <- var.9_mpd_data[ , !names(var.9_mpd_data) %in% var.9]

#subset bat_env_geo file for the 0.8 cutoff
#var.8_data <- subset(variable_data, select = -c(PD,SR,mpd))
var.8_mntd_data <- subset(variable_data, select = -c(Ecoregion,PD,SR,mpd))
var.8_mntd_data <- var.8_mntd_data[ , !names(var.8_mntd_data) %in% var.8]
var.8_mpd_data <- subset(variable_data, select = -c(Ecoregion,PD,SR,mntd))
var.8_mpd_data <- var.8_mpd_data[ , !names(var.8_mpd_data) %in% var.8]

#subset bat_env_geo file for the 0.7 cutoff
#var.7_data <- subset(variable_data, select = -c(PD,SR,mpd))
var.7_mntd_data <- subset(variable_data, select = -c(Ecoregion,PD,SR,mpd))
var.7_mntd_data <- var.7_mntd_data[ , !names(var.7_mntd_data) %in% var.7]
var.7_mpd_data <- subset(variable_data, select = -c(Ecoregion,PD,SR,mntd))
var.7_mpd_data <- var.7_mpd_data[ , !names(var.7_mpd_data) %in% var.7]

### RANDOM FOREST ###

#0.9 Cutoff
RF_mntd_0.9 <- randomForest(mntd ~ ., data = var.9_mntd_data, importance=TRUE, ntree=1000, replace=T)
RF_mpd_0.9 <- randomForest(mpd ~ ., data = var.9_mpd_data, importance=TRUE, ntree=1000, replace=T)


#0.8 Cutoff
RF_mntd_0.8 <- randomForest(mntd ~ ., data = var.8_mntd_data, importance=TRUE, ntree=1000, replace=T)
RF_mpd_0.8 <- randomForest(mpd ~ ., data = var.8_mpd_data, importance=TRUE, ntree=1000, replace=T)


#0.7 Cutoff
RF_mntd_0.7 <- randomForest(mntd ~ ., data = var.7_mntd_data, importance=TRUE, ntree=1000, replace=T)
RF_mpd_0.7 <- randomForest(mpd ~ ., data = var.7_mpd_data, importance=TRUE, ntree=1000, replace=T)

#export importance measures
write.csv(RF_mntd_0.9$importance, file="imp0.9-mntd-215.csv")
write.csv(RF_mpd_0.9$importance, file="imp0.9-mpd-215.csv")
write.csv(RF_mntd_0.8$importance, file="imp0.8-mntd-215.csv")
write.csv(RF_mpd_0.8$importance, file="imp0.8-mpd-215.csv")
write.csv(RF_mntd_0.7$importance, file="imp0.7-mntd-215.csv")
write.csv(RF_mpd_0.7$importance, file="imp0.7-mpd-215.csv")


#################### Variable Groupings ####################

#subset variable data for the Geo group (pink)
geo_data <- variable_data[,1:14]
#subset variable data for the current bio group (blue)
curr_bio <- variable_data[,1:52]
curr_bio <- curr_bio[,-(6:14)]
#subset variable data for the misc group (gray)
misc_data <- variable_data[,1:82]
misc_data <- misc_data[,-(6:52)]

#subset variable data for LGM group (orange)
LGM_data <- cbind(variable_data[,1:5], variable_data %>% dplyr::select(contains("LGM")))
#subset variable data for LIG group (green)
LIG_data <- cbind(variable_data[,1:5], variable_data %>% dplyr::select(contains("LIG")))
#subset variable data for Plio group (yellow)
Plio_data <- cbind(variable_data[,1:5], variable_data %>% dplyr::select(contains("Plio")))

#geo variables
RF_mntd_geo <- randomForest(geo_data[,6:14], geo_data$mntd, importance=TRUE, ntree=1000, replace=T)
RF_mpd_geo <- randomForest(geo_data[,6:14], geo_data$mpd, importance=TRUE, ntree=1000, replace=T)
write.csv(RF_mntd_geo$importance, file="imp_mntd_geo-215.csv")
write.csv(RF_mpd_geo$importance, file="imp_mpd_geo-215.csv")

#Current bio variables
RF_mntd_curr_bio <- randomForest(curr_bio[,6:43], curr_bio$mntd, importance=TRUE, ntree=1000, replace=T)
RF_mpd_curr_bio <- randomForest(curr_bio[,6:43], curr_bio$mpd, importance=TRUE, ntree=1000, replace=T)
write.csv(RF_mntd_curr_bio$importance, file="imp_mntd_curr_bio-215.csv")
write.csv(RF_mpd_curr_bio$importance, file="imp_mpd_curr_bio-215.csv")

#Misc variables
RF_mntd_misc <- randomForest(misc_data[,6:35], misc_data$mntd, importance=TRUE, ntree=1000, replace=T)
RF_mpd_misc <- randomForest(misc_data[,6:35], misc_data$mpd, importance=TRUE, ntree=1000, replace=T)
write.csv(RF_mntd_misc$importance, file="imp_mntd_misc-215.csv")
write.csv(RF_mpd_misc$importance, file="imp_mpd_misc-215.csv")

#LGM variables
RF_mntd_LGM <- randomForest(LGM_data[,6:62], LGM_data$mntd, importance=TRUE, ntree=1000, replace=T)
RF_mpd_LGM <- randomForest(LGM_data[,6:62], LGM_data$mpd, importance=TRUE, ntree=1000, replace=T)
write.csv(RF_mntd_LGM$importance, file="imp_mntd_LGM-215.csv")
write.csv(RF_mpd_LGM$importance, file="imp_mpd_LGM-215.csv")

#LIG variables
RF_mntd_LIG <- randomForest(LIG_data[,6:62], LIG_data$mntd, importance=TRUE, ntree=1000, replace=T)
RF_mpd_LIG <- randomForest(LIG_data[,6:62], LIG_data$mpd, importance=TRUE, ntree=1000, replace=T)
write.csv(RF_mntd_LIG$importance, file="imp_mntd_LIG-215.csv")
write.csv(RF_mpd_LIG$importance, file="imp_mpd_LIG-215.csv")

#Plio variables
RF_mntd_Plio <- randomForest(Plio_data[,6:47], Plio_data$mntd, importance=TRUE, ntree=1000, replace=T)
RF_mpd_Plio <- randomForest(Plio_data[,6:47], Plio_data$mpd, importance=TRUE, ntree=1000, replace=T)
write.csv(RF_mntd_Plio$importance, file="imp_mntd_Plio-215.csv")
write.csv(RF_mpd_Plio$importance, file="imp_mpd_Plio-215.csv")

#################### Variable Groupings with 0.9 Cutoff ####################

#subset variable data for the Geo group (pink)
geo.9_mntd_data <- var.9_mntd_data[,1:6]
geo.9_mpd_data <- var.9_mpd_data[,1:6]
#subset variable data for the current bio group (blue)
curr_bio.9_mntd_data <- var.9_mntd_data[,1:32]
curr_bio.9_mntd_data <- curr_bio.9_mntd_data[,-(2:6)]
curr_bio.9_mpd_data <- var.9_mpd_data[,1:32]
curr_bio.9_mpd_data <- curr_bio.9_mpd_data[,-(2:6)]
#subset variable data for the misc group (gray)
misc.9_mntd_data <- var.9_mntd_data[,1:60]
misc.9_mntd_data <- misc.9_mntd_data[,-(2:32)]
misc.9_mpd_data <- var.9_mpd_data[,1:60]
misc.9_mpd_data <- misc.9_mpd_data[,-(2:32)]

#subset variable data for LGM group (orange)
LGM.9_mntd_data <- cbind(var.9_mntd_data$mntd, var.9_mntd_data %>% dplyr::select(contains("LGM")))
LGM.9_mpd_data <- cbind(var.9_mpd_data$mpd, var.9_mpd_data %>% dplyr::select(contains("LGM")))
colnames(LGM.9_mntd_data)[1] = "mntd"
colnames(LGM.9_mpd_data)[1] = "mpd"

#subset variable data for LIG group (green)
LIG.9_mntd_data <- cbind(var.9_mntd_data$mntd, var.9_mntd_data %>% dplyr::select(contains("LIG")))
LIG.9_mpd_data <- cbind(var.9_mpd_data$mpd, var.9_mpd_data %>% dplyr::select(contains("LIG")))
colnames(LIG.9_mntd_data)[1] = "mntd"
colnames(LIG.9_mpd_data)[1] = "mpd"

#subset variable data for Plio group (yellow)
Plio.9_mntd_data <- cbind(var.9_mntd_data$mntd, var.9_mntd_data %>% dplyr::select(contains("Plio")))
Plio.9_mpd_data <- cbind(var.9_mpd_data$mpd, var.9_mpd_data %>% dplyr::select(contains("Plio")))
colnames(Plio.9_mntd_data)[1] = "mntd"
colnames(Plio.9_mpd_data)[1] = "mpd"

### Random Forest ###

#geo variables
RF_mntd_geo.9 <- randomForest(mntd ~ ., data = geo.9_mntd_data, importance=TRUE, ntree=1000, replace=T)
RF_mpd_geo.9 <- randomForest(mpd ~ ., data = geo.9_mpd_data, importance=TRUE, ntree=1000, replace=T)
write.csv(RF_mntd_geo.9$importance, file="imp_mntd_geo.9-215.csv")
write.csv(RF_mpd_geo.9$importance, file="imp_mpd_geo.9-215.csv")

#current bio variables
RF_mntd_curr_bio.9 <- randomForest(mntd ~ ., data = curr_bio.9_mntd_data, importance=TRUE, ntree=1000, replace=T)
RF_mpd_curr_bio.9 <- randomForest(mpd ~ ., data = curr_bio.9_mpd_data, importance=TRUE, ntree=1000, replace=T)
write.csv(RF_mntd_curr_bio.9$importance, file="imp_mntd_curr_bio.9-215.csv")
write.csv(RF_mpd_curr_bio.9$importance, file="imp_mpd_curr_bio.9-215.csv")

#misc variables
RF_mntd_misc.9 <- randomForest(mntd ~ ., data = misc.9_mntd_data, importance=TRUE, ntree=1000, replace=T)
RF_mpd_misc.9 <- randomForest(mpd ~ ., data = misc.9_mpd_data, importance=TRUE, ntree=1000, replace=T)
write.csv(RF_mntd_misc.9$importance, file="imp_mntd_misc.9-215.csv")
write.csv(RF_mpd_misc.9$importance, file="imp_mpd_misc.9-215.csv")

#LGM variables
RF_mntd_LGM.9 <- randomForest(LGM.9_mntd_data[,2:27], LGM.9_mntd_data$mntd, importance=TRUE, ntree=1000, replace=T)
RF_mpd_LGM.9 <- randomForest(LGM.9_mpd_data[,2:27], LGM.9_mpd_data$mpd, importance=TRUE, ntree=1000, replace=T)
write.csv(RF_mntd_LGM.9$importance, file="imp_mntd_LGM.9-215.csv")
write.csv(RF_mpd_LGM.9$importance, file="imp_mpd_LGM.9-215.csv")

#LIG variables
RF_mntd_LIG.9 <- randomForest(LIG.9_mntd_data[,2:21], LIG.9_mntd_data$mntd, importance=TRUE, ntree=1000, replace=T)
RF_mpd_LIG.9 <- randomForest(LIG.9_mpd_data[,2:21], LIG.9_mpd_data$mpd, importance=TRUE, ntree=1000, replace=T)
write.csv(RF_mntd_LIG.9$importance, file="imp_mntd_LIG.9-215.csv")
write.csv(RF_mpd_LIG.9$importance, file="imp_mpd_LIG.9-215.csv")

#Plio variables
RF_mntd_Plio.9 <- randomForest(Plio.9_mntd_data[,2:15], Plio.9_mntd_data$mntd, importance=TRUE, ntree=1000, replace=T)
RF_mpd_Plio.9 <- randomForest(Plio.9_mpd_data[,2:15], Plio.9_mpd_data$mpd, importance=TRUE, ntree=1000, replace=T)
write.csv(RF_mntd_Plio.9$importance, file="imp_mntd_Plio.9-215.csv")
write.csv(RF_mpd_Plio.9$importance, file="imp_mpd_Plio.9-215.csv")

#################### Random Forest with Top Variables ####################

top_mpd_data <- subset(variable_data, select = c(mpd,lat_mean, bio3_sd, bio14_mean, 
                                                 bio14_sd, gsl_mean, GDEM_mean, bio3_LGM_sd, 
                                                 bio15_LGM_mean, bio19_LGM_diff, bio2_LIG_sd, 
                                                 bio3_LIG_sd, bio9_LIG_diff, bio1_Plio_diff, 
                                                 bio8_Plio_sd, bio11_Plio_diff))
top_mntd_data <- subset(variable_data, select = c(mntd,lat_mean, bio3_sd, bio14_mean, 
                                                  bio14_sd, gsl_mean, GDEM_mean, bio3_LGM_sd, 
                                                  bio15_LGM_mean, bio19_LGM_diff, bio2_LIG_sd, 
                                                  bio3_LIG_sd, bio9_LIG_diff, bio1_Plio_diff, 
                                                  bio8_Plio_sd, bio11_Plio_diff))

RF_mntd_top <- randomForest(mntd ~ ., data = top_mntd_data, importance=TRUE, ntree=1000, replace=T)
RF_mpd_top <- randomForest(mpd ~ ., data = top_mpd_data, importance=TRUE, ntree=1000, replace=T)
write.csv(RF_mpd_top$importance, file="imp_mpd_top.csv")
write.csv(RF_mntd_top$importance, file="imp_mntd_top.csv")

