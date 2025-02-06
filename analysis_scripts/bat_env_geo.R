library(raster)
library(tools)
library(sf)

?#Set working directory

#download bioclim layers
#import layers
bio1 <- raster("CHELSA_bio1_1981-2010_V.2.1.tif")
bio2 <- raster("CHELSA_bio2_1981-2010_V.2.1.tif")
bio3 <- raster("CHELSA_bio3_1981-2010_V.2.1.tif")
bio4 <- raster("CHELSA_bio4_1981-2010_V.2.1.tif")
bio5 <- raster("CHELSA_bio5_1981-2010_V.2.1.tif")
bio6 <- raster("CHELSA_bio6_1981-2010_V.2.1.tif")
bio7 <- raster("CHELSA_bio7_1981-2010_V.2.1.tif")
bio8 <- raster("CHELSA_bio8_1981-2010_V.2.1.tif")
bio9 <- raster("CHELSA_bio9_1981-2010_V.2.1.tif")
bio10 <- raster("CHELSA_bio10_1981-2010_V.2.1.tif")
bio11 <- raster("CHELSA_bio11_1981-2010_V.2.1.tif")
bio12 <- raster("CHELSA_bio12_1981-2010_V.2.1.tif")
bio13 <- raster("CHELSA_bio13_1981-2010_V.2.1.tif")
bio14 <- raster("CHELSA_bio14_1981-2010_V.2.1.tif")
bio15 <- raster("CHELSA_bio15_1981-2010_V.2.1.tif")
bio16 <- raster("CHELSA_bio16_1981-2010_V.2.1.tif")
bio17 <- raster("CHELSA_bio17_1981-2010_V.2.1.tif")
bio18 <- raster("CHELSA_bio18_1981-2010_V.2.1.tif")
bio19 <- raster("CHELSA_bio19_1981-2010_V.2.1.tif")
gdgfgd0 <- raster("CHELSA_gdgfgd0_1981-2010_V.2.1.tif")
gdgfgd5 <- raster("CHELSA_gdgfgd5_1981-2010_V.2.1.tif")
gdgfgd10 <- raster("CHELSA_gdgfgd10_1981-2010_V.2.1.tif")
gsl <- raster("CHELSA_gsl_1981-2010_V.2.1.tif")
gsp <- raster("CHELSA_gsp_1981-2010_V.2.1.tif")
gst <- raster("CHELSA_gst_1981-2010_V.2.1.tif")
lgd <- raster("CHELSA_lgd_1981-2010_V.2.1.tif")
fgd <- raster("CHELSA_fgd_1981-2010_V.2.1.tif")
kg2 <- raster("CHELSA_kg2_1981-2010_V.2.1.tif")
scd <- raster("CHELSA_scd_1981-2010_V.2.1.tif")
swe <- raster("CHELSA_swe_1981-2010_V.2.1.tif")
npp <- raster("CHELSA_npp_1981-2010_V.2.1.tif")

globCover <- raster("GLOBCOVER_L4_200901_200912_V2.3.tif")
GDEM <- raster("GDEM-10km-BW.tif")
gpw <- raster("gpw_v4_population_density_rev11_2020_30_sec.tif")
gdp <- raster("GDP.tif")
fi_average <- raster("fi_average.tif")
fl_risk <- raster("fl1010irmt.tif")
dr_events <- raster("dr_events.tif")
anth <- raster("an12_dgg.tif")
GloRiC <- raster("GloRiC1.tif")
GLWD_1 <- raster("glwd_1.tif")
GLWD_2 <- raster("glwd_2.tif")
cv <- raster("cv_01_05_1km_uint16.tif")
shannon <- raster("shannon_01_05_1km_uint16.tif")

bio1_LGM <- raster("chelsa_LGM_v1_2B_r30s/30sec/bio_1.tif")
bio2_LGM <- raster("chelsa_LGM_v1_2B_r30s/30sec/bio_2.tif")
bio3_LGM <- raster("chelsa_LGM_v1_2B_r30s/30sec/bio_3.tif")
bio4_LGM <- raster("chelsa_LGM_v1_2B_r30s/30sec/bio_4.tif")
bio5_LGM <- raster("chelsa_LGM_v1_2B_r30s/30sec/bio_5.tif")
bio6_LGM <- raster("chelsa_LGM_v1_2B_r30s/30sec/bio_6.tif")
bio7_LGM <- raster("chelsa_LGM_v1_2B_r30s/30sec/bio_7.tif")
bio8_LGM <- raster("chelsa_LGM_v1_2B_r30s/30sec/bio_8.tif")
bio9_LGM <- raster("chelsa_LGM_v1_2B_r30s/30sec/bio_9.tif")
bio10_LGM <- raster("chelsa_LGM_v1_2B_r30s/30sec/bio_10.tif")
bio11_LGM <- raster("chelsa_LGM_v1_2B_r30s/30sec/bio_11.tif")
bio12_LGM <- raster("chelsa_LGM_v1_2B_r30s/30sec/bio_12.tif")
bio13_LGM <- raster("chelsa_LGM_v1_2B_r30s/30sec/bio_13.tif")
bio14_LGM <- raster("chelsa_LGM_v1_2B_r30s/30sec/bio_14.tif")
bio15_LGM <- raster("chelsa_LGM_v1_2B_r30s/30sec/bio_15.tif")
bio16_LGM <- raster("chelsa_LGM_v1_2B_r30s/30sec/bio_16.tif")
bio17_LGM <- raster("chelsa_LGM_v1_2B_r30s/30sec/bio_17.tif")
bio18_LGM <- raster("chelsa_LGM_v1_2B_r30s/30sec/bio_18.tif")
bio19_LGM <- raster("chelsa_LGM_v1_2B_r30s/30sec/bio_19.tif")

bio1_LIG <- raster("LIG_v1_2_5m/bio_1.tif")
bio2_LIG <- raster("LIG_v1_2_5m/bio_2.tif")
bio3_LIG <- raster("LIG_v1_2_5m/bio_3.tif")
bio4_LIG <- raster("LIG_v1_2_5m/bio_4.tif")
bio5_LIG <- raster("LIG_v1_2_5m/bio_5.tif")
bio6_LIG <- raster("LIG_v1_2_5m/bio_6.tif")
bio7_LIG <- raster("LIG_v1_2_5m/bio_7.tif")
bio8_LIG <- raster("LIG_v1_2_5m/bio_8.tif")
bio9_LIG <- raster("LIG_v1_2_5m/bio_9.tif")
bio10_LIG <- raster("LIG_v1_2_5m/bio_10.tif")
bio11_LIG <- raster("LIG_v1_2_5m/bio_11.tif")
bio12_LIG <- raster("LIG_v1_2_5m/bio_12.tif")
bio13_LIG <- raster("LIG_v1_2_5m/bio_13.tif")
bio14_LIG <- raster("LIG_v1_2_5m/bio_14.tif")
bio15_LIG <- raster("LIG_v1_2_5m/bio_15.tif")
bio16_LIG <- raster("LIG_v1_2_5m/bio_16.tif")
bio17_LIG <- raster("LIG_v1_2_5m/bio_17.tif")
bio18_LIG <- raster("LIG_v1_2_5m/bio_18.tif")
bio19_LIG <- raster("LIG_v1_2_5m/bio_19.tif")

bio1_Plio <- raster("M2_v1_r2_5m/2_5min/bio_1.tif")
bio4_Plio <- raster("M2_v1_r2_5m/2_5min/bio_4.tif")
bio8_Plio <- raster("M2_v1_r2_5m/2_5min/bio_8.tif")
bio9_Plio <- raster("M2_v1_r2_5m/2_5min/bio_9.tif")
bio10_Plio <- raster("M2_v1_r2_5m/2_5min/bio_10.tif")
bio11_Plio <- raster("M2_v1_r2_5m/2_5min/bio_11.tif")
bio12_Plio <- raster("M2_v1_r2_5m/2_5min/bio_12.tif")
bio13_Plio <- raster("M2_v1_r2_5m/2_5min/bio_13.tif")
bio14_Plio <- raster("M2_v1_r2_5m/2_5min/bio_14.tif")
bio15_Plio <- raster("M2_v1_r2_5m/2_5min/bio_15.tif")
bio16_Plio <- raster("M2_v1_r2_5m/2_5min/bio_16.tif")
bio17_Plio <- raster("M2_v1_r2_5m/2_5min/bio_17.tif")
bio18_Plio <- raster("M2_v1_r2_5m/2_5min/bio_18.tif")
bio19_Plio <- raster("M2_v1_r2_5m/2_5min/bio_19.tif")

#get a list of shapefiles
myfiles <- list.files(path = "polys", pattern = ".shp", full.names=T, recursive = TRUE)
myfiles <- list.files(path = "polys2", pattern = ".shp", full.names=T, recursive = TRUE)
myfiles <- list.files(path = "ecoregions_selected_216", pattern = ".shp", full.names=T, recursive = TRUE)
myfiles <- list.files(path = "Ecoregions_4", pattern = ".shp", full.names=T, recursive = TRUE)

#look at a sampling of 1000 points for each polygon
pdf(file = "PolysAndPoints.pdf")
for (poly in myfiles) {
  shpfile <- st_make_valid(st_read(poly))
  xy <- st_sample(shpfile,size = 1000,"random")
  
  plot(shpfile)
  plot(xy)
}
dev.off()

for (poly in myfiles) {
  
  #import shapfile
  shpfile <- st_make_valid(st_read(poly))
  #create random set of points within polygon
  xy <- st_as_sf(st_sample(shpfile,size = 1000,"random"))
  
  #get name for output
  Ecoregion <- file_path_sans_ext(basename(poly))
  
  #get area of polygon
  area <- st_area(shpfile) / 1000000
  
  #get geographic info
  coord <- data.frame(st_coordinates(xy))
  
  lat_mean <- mean(coord$X)
  lat_min <- min(coord$X)
  lat_max <- max(coord$X)
  lat_length <- lat_max - lat_min
  
  lon_mean <- mean(coord$Y)
  lon_min <- min(coord$Y)
  lon_max <- max(coord$Y)
  lon_length <- lon_max - lon_min

  
  #extract values for all points

  bio1xy <- extract(bio1, xy)
  bio1_mean <- mean(bio1xy, na.rm = T)
  bio1_sd <- sd(bio1xy, na.rm = T)
  
  bio1_LGMxy <- extract(bio1_LGM, xy)
  bio1_LGM_mean <- mean(bio1_LGMxy, na.rm = T)
  bio1_LGM_sd <- sd(bio1_LGMxy, na.rm = T)
  
  bio1_LIGxy <- extract(bio1_LIG, xy)
  bio1_LIG_mean <- mean(bio1_LIGxy, na.rm = T)
  bio1_LIG_sd <- sd(bio1_LIGxy, na.rm = T)
  
  bio1_Plioxy <- extract(bio1_Plio, xy)
  bio1_Plio_mean <- mean(bio1_Plioxy, na.rm = T)
  bio1_Plio_sd <- sd(bio1_Plioxy, na.rm = T)
  
  bio1_LGM_diff <- bio1_mean - bio1_LGM_mean
  bio1_LIG_diff <- bio1_mean - bio1_LIG_mean
  bio1_Plio_diff <- bio1_mean - bio1_Plio_mean
  
  bio2xy <- extract(bio2, xy)
  bio2_mean <- mean(bio2xy, na.rm = T)
  bio2_sd <- sd(bio2xy, na.rm = T)
  
  bio2_LGMxy <- extract(bio2_LGM, xy)
  bio2_LGM_mean <- mean(bio2_LGMxy, na.rm = T)
  bio2_LGM_sd <- sd(bio2_LGMxy, na.rm = T)
  
  bio2_LIGxy <- extract(bio2_LIG, xy)
  bio2_LIG_mean <- mean(bio2_LIGxy, na.rm = T)
  bio2_LIG_sd <- sd(bio2_LIGxy, na.rm = T)
  
  bio2_LGM_diff <- bio2_mean - bio2_LGM_mean
  bio2_LIG_diff <- bio2_mean - bio2_LIG_mean
  
  bio3xy <- extract(bio3, xy)
  bio3_mean <- mean(bio3xy, na.rm = T)
  bio3_sd <- sd(bio3xy, na.rm = T)
  
  bio3_LGMxy <- extract(bio3_LGM, xy)
  bio3_LGM_mean <- mean(bio3_LGMxy, na.rm = T)
  bio3_LGM_sd <- sd(bio3_LGMxy, na.rm = T)
  
  bio3_LIGxy <- extract(bio3_LIG, xy)
  bio3_LIG_mean <- mean(bio3_LIGxy, na.rm = T)
  bio3_LIG_sd <- sd(bio3_LIGxy, na.rm = T)
  
  bio3_LGM_diff <- bio3_mean - bio3_LGM_mean
  bio3_LIG_diff <- bio3_mean - bio3_LIG_mean
  
  bio4xy <- extract(bio4, xy)
  bio4_mean <- mean(bio4xy, na.rm = T)
  bio4_sd <- sd(bio4xy, na.rm = T)
  
  bio4_LGMxy <- extract(bio4_LGM, xy)
  bio4_LGM_mean <- mean(bio4_LGMxy, na.rm = T)
  bio4_LGM_sd <- sd(bio4_LGMxy, na.rm = T)
  
  bio4_LIGxy <- extract(bio4_LIG, xy)
  bio4_LIG_mean <- mean(bio4_LIGxy, na.rm = T)
  bio4_LIG_sd <- sd(bio4_LIGxy, na.rm = T)
  
  bio4_Plioxy <- extract(bio4_Plio, xy)
  bio4_Plio_mean <- mean(bio4_Plioxy, na.rm = T)
  bio4_Plio_sd <- sd(bio4_Plioxy, na.rm = T)
  
  bio4_LGM_diff <- bio4_mean - bio4_LGM_mean
  bio4_LIG_diff <- bio4_mean - bio4_LIG_mean
  bio4_Plio_diff <- bio4_mean - bio4_Plio_mean
  
  bio5xy <- extract(bio5, xy)
  bio5_mean <- mean(bio5xy)
  bio5_sd <- sd(bio5xy)
  
  bio5_LGMxy <- extract(bio5_LGM, xy)
  bio5_LGM_mean <- mean(bio5_LGMxy, na.rm = T)
  bio5_LGM_sd <- sd(bio5_LGMxy, na.rm = T)
  
  bio5_LIGxy <- extract(bio5_LIG, xy)
  bio5_LIG_mean <- mean(bio5_LIGxy, na.rm = T)
  bio5_LIG_sd <- sd(bio5_LIGxy, na.rm = T)
  
  bio5_LGM_diff <- bio5_mean - bio5_LGM_mean
  bio5_LIG_diff <- bio5_mean - bio5_LIG_mean
  
  bio6xy <- extract(bio6, xy)
  bio6_mean <- mean(bio6xy, na.rm = T)
  bio6_sd <- sd(bio6xy, na.rm = T)
  
  bio6_LGMxy <- extract(bio6_LGM, xy)
  bio6_LGM_mean <- mean(bio6_LGMxy, na.rm = T)
  bio6_LGM_sd <- sd(bio6_LGMxy, na.rm = T)
  
  bio6_LIGxy <- extract(bio6_LIG, xy)
  bio6_LIG_mean <- mean(bio6_LIGxy, na.rm = T)
  bio6_LIG_sd <- sd(bio6_LIGxy, na.rm = T)
  
  bio6_LGM_diff <- bio6_mean - bio6_LGM_mean
  bio6_LIG_diff <- bio6_mean - bio6_LIG_mean
  
  bio7xy <- extract(bio7, xy)
  bio7_mean <- mean(bio7xy, na.rm = T)
  bio7_sd <- sd(bio7xy, na.rm = T)
  
  bio7_LGMxy <- extract(bio7_LGM, xy)
  bio7_LGM_mean <- mean(bio7_LGMxy, na.rm = T)
  bio7_LGM_sd <- sd(bio7_LGMxy, na.rm = T)
  
  bio7_LIGxy <- extract(bio7_LIG, xy)
  bio7_LIG_mean <- mean(bio7_LIGxy, na.rm = T)
  bio7_LIG_sd <- sd(bio7_LIGxy, na.rm = T)
  
  bio7_LGM_diff <- bio7_mean - bio7_LGM_mean
  bio7_LIG_diff <- bio7_mean - bio7_LIG_mean
  
  bio8xy <- extract(bio8, xy)
  bio8_mean <- mean(bio8xy, na.rm = T)
  bio8_sd <- sd(bio8xy, na.rm = T)
  
  bio8_LGMxy <- extract(bio8_LGM, xy)
  bio8_LGM_mean <- mean(bio8_LGMxy, na.rm = T)
  bio8_LGM_sd <- sd(bio8_LGMxy, na.rm = T)
  
  bio8_LIGxy <- extract(bio8_LIG, xy)
  bio8_LIG_mean <- mean(bio8_LIGxy, na.rm = T)
  bio8_LIG_sd <- sd(bio8_LIGxy, na.rm = T)
  
  bio8_Plioxy <- extract(bio8_Plio, xy)
  bio8_Plio_mean <- mean(bio8_Plioxy, na.rm = T)
  bio8_Plio_sd <- sd(bio8_Plioxy, na.rm = T)
  
  bio8_LGM_diff <- bio8_mean - bio8_LGM_mean
  bio8_LIG_diff <- bio8_mean - bio8_LIG_mean
  bio8_Plio_diff <- bio8_mean - bio8_Plio_mean
  
  bio9xy <- extract(bio9, xy)
  bio9_mean <- mean(bio9xy, na.rm = T)
  bio9_sd <- sd(bio9xy, na.rm = T)
  
  bio9_LGMxy <- extract(bio9_LGM, xy)
  bio9_LGM_mean <- mean(bio9_LGMxy, na.rm = T)
  bio9_LGM_sd <- sd(bio9_LGMxy, na.rm = T)
  
  bio9_LIGxy <- extract(bio9_LIG, xy)
  bio9_LIG_mean <- mean(bio9_LIGxy, na.rm = T)
  bio9_LIG_sd <- sd(bio9_LIGxy, na.rm = T)
  
  bio9_Plioxy <- extract(bio9_Plio, xy)
  bio9_Plio_mean <- mean(bio9_Plioxy, na.rm = T)
  bio9_Plio_sd <- sd(bio9_Plioxy, na.rm = T)
  
  bio9_LGM_diff <- bio9_mean - bio9_LGM_mean
  bio9_LIG_diff <- bio9_mean - bio9_LIG_mean
  bio9_Plio_diff <- bio9_mean - bio9_Plio_mean
  
  bio10xy <- extract(bio10, xy)
  bio10_mean <- mean(bio10xy, na.rm = T)
  bio10_sd <- sd(bio10xy, na.rm = T)
  
  bio10_LGMxy <- extract(bio10_LGM, xy)
  bio10_LGM_mean <- mean(bio10_LGMxy, na.rm = T)
  bio10_LGM_sd <- sd(bio10_LGMxy, na.rm = T)
  
  bio10_LIGxy <- extract(bio10_LIG, xy)
  bio10_LIG_mean <- mean(bio10_LIGxy, na.rm = T)
  bio10_LIG_sd <- sd(bio10_LIGxy, na.rm = T)
  
  bio10_Plioxy <- extract(bio10_Plio, xy)
  bio10_Plio_mean <- mean(bio10_Plioxy, na.rm = T)
  bio10_Plio_sd <- sd(bio10_Plioxy, na.rm = T)
  
  bio10_LGM_diff <- bio10_mean - bio10_LGM_mean
  bio10_LIG_diff <- bio10_mean - bio10_LIG_mean
  bio10_Plio_diff <- bio10_mean - bio10_Plio_mean
  
  bio11xy <- extract(bio11, xy)
  bio11_mean <- mean(bio11xy, na.rm = T)
  bio11_sd <- sd(bio11xy, na.rm = T)
  
  bio11_LGMxy <- extract(bio11_LGM, xy)
  bio11_LGM_mean <- mean(bio11_LGMxy, na.rm = T)
  bio11_LGM_sd <- sd(bio11_LGMxy, na.rm = T)
  
  bio11_LIGxy <- extract(bio11_LIG, xy)
  bio11_LIG_mean <- mean(bio11_LIGxy, na.rm = T)
  bio11_LIG_sd <- sd(bio11_LIGxy, na.rm = T)
  
  bio11_Plioxy <- extract(bio11_Plio, xy)
  bio11_Plio_mean <- mean(bio11_Plioxy, na.rm = T)
  bio11_Plio_sd <- sd(bio11_Plioxy, na.rm = T)
  
  bio11_LGM_diff <- bio11_mean - bio11_LGM_mean
  bio11_LIG_diff <- bio11_mean - bio11_LIG_mean
  bio11_Plio_diff <- bio11_mean - bio11_Plio_mean
  
  bio12xy <- extract(bio12, xy)
  bio12_mean <- mean(bio12xy, na.rm = T)
  bio12_sd <- sd(bio12xy, na.rm = T)
  
  bio12_LGMxy <- extract(bio12_LGM, xy)
  bio12_LGM_mean <- mean(bio12_LGMxy, na.rm = T)
  bio12_LGM_sd <- sd(bio12_LGMxy, na.rm = T)
  
  bio12_LIGxy <- extract(bio12_LIG, xy)
  bio12_LIG_mean <- mean(bio12_LIGxy, na.rm = T)
  bio12_LIG_sd <- sd(bio12_LIGxy, na.rm = T)
  
  bio12_Plioxy <- extract(bio12_Plio, xy)
  bio12_Plio_mean <- mean(bio12_Plioxy, na.rm = T)
  bio12_Plio_sd <- sd(bio12_Plioxy, na.rm = T)
  
  bio12_LGM_diff <- bio12_mean - bio12_LGM_mean
  bio12_LIG_diff <- bio12_mean - bio12_LIG_mean
  bio12_Plio_diff <- bio12_mean - bio12_Plio_mean
  
  bio13xy <- extract(bio13, xy)
  bio13_mean <- mean(bio13xy, na.rm = T)
  bio13_sd <- sd(bio13xy, na.rm = T)
  
  bio13_LGMxy <- extract(bio13_LGM, xy)
  bio13_LGM_mean <- mean(bio13_LGMxy, na.rm = T)
  bio13_LGM_sd <- sd(bio13_LGMxy, na.rm = T)
  
  bio13_LIGxy <- extract(bio13_LIG, xy)
  bio13_LIG_mean <- mean(bio13_LIGxy, na.rm = T)
  bio13_LIG_sd <- sd(bio13_LIGxy, na.rm = T)
  
  bio13_Plioxy <- extract(bio13_Plio, xy)
  bio13_Plio_mean <- mean(bio13_Plioxy, na.rm = T)
  bio13_Plio_sd <- sd(bio13_Plioxy, na.rm = T)
  
  bio13_LGM_diff <- bio13_mean - bio13_LGM_mean
  bio13_LIG_diff <- bio13_mean - bio13_LIG_mean
  bio13_Plio_diff <- bio13_mean - bio13_Plio_mean
  
  bio14xy <- extract(bio14, xy)
  bio14_mean <- mean(bio14xy, na.rm = T)
  bio14_sd <- sd(bio14xy, na.rm = T)
  
  bio14_LGMxy <- extract(bio14_LGM, xy)
  bio14_LGM_mean <- mean(bio14_LGMxy, na.rm = T)
  bio14_LGM_sd <- sd(bio14_LGMxy, na.rm = T)
  
  bio14_LIGxy <- extract(bio14_LIG, xy)
  bio14_LIG_mean <- mean(bio14_LIGxy, na.rm = T)
  bio14_LIG_sd <- sd(bio14_LIGxy, na.rm = T)
  
  bio14_Plioxy <- extract(bio14_Plio, xy)
  bio14_Plio_mean <- mean(bio14_Plioxy, na.rm = T)
  bio14_Plio_sd <- sd(bio14_Plioxy, na.rm = T)
  
  bio14_LGM_diff <- bio14_mean - bio14_LGM_mean
  bio14_LIG_diff <- bio14_mean - bio14_LIG_mean
  bio14_Plio_diff <- bio14_mean - bio14_Plio_mean
  
  bio15xy <- extract(bio15, xy)
  bio15_mean <- mean(bio15xy, na.rm = T)
  bio15_sd <- sd(bio15xy, na.rm = T)
  
  bio15_LGMxy <- extract(bio15_LGM, xy)
  bio15_LGM_mean <- mean(bio15_LGMxy, na.rm = T)
  bio15_LGM_sd <- sd(bio15_LGMxy, na.rm = T)
  
  bio15_LIGxy <- extract(bio15_LIG, xy)
  bio15_LIG_mean <- mean(bio15_LIGxy, na.rm = T)
  bio15_LIG_sd <- sd(bio15_LIGxy, na.rm = T)
  
  bio15_Plioxy <- extract(bio15_Plio, xy)
  bio15_Plio_mean <- mean(bio15_Plioxy, na.rm = T)
  bio15_Plio_sd <- sd(bio15_Plioxy, na.rm = T)
  
  bio15_LGM_diff <- bio15_mean - bio15_LGM_mean
  bio15_LIG_diff <- bio15_mean - bio15_LIG_mean
  bio15_Plio_diff <- bio15_mean - bio15_Plio_mean

  bio16xy <- extract(bio16, xy)
  bio16_mean <- mean(bio16xy, na.rm = T)
  bio16_sd <- sd(bio16xy, na.rm = T)
  
  bio16_LGMxy <- extract(bio16_LGM, xy)
  bio16_LGM_mean <- mean(bio16_LGMxy, na.rm = T)
  bio16_LGM_sd <- sd(bio16_LGMxy, na.rm = T)
  
  bio16_LIGxy <- extract(bio16_LIG, xy)
  bio16_LIG_mean <- mean(bio16_LIGxy, na.rm = T)
  bio16_LIG_sd <- sd(bio16_LIGxy, na.rm = T)
  
  bio16_Plioxy <- extract(bio16_Plio, xy)
  bio16_Plio_mean <- mean(bio16_Plioxy, na.rm = T)
  bio16_Plio_sd <- sd(bio16_Plioxy, na.rm = T)
  
  bio16_LGM_diff <- bio16_mean - bio16_LGM_mean
  bio16_LIG_diff <- bio16_mean - bio16_LIG_mean
  bio16_Plio_diff <- bio16_mean - bio16_Plio_mean
  
  bio17xy <- extract(bio17, xy)
  bio17_mean <- mean(bio17xy, na.rm = T)
  bio17_sd <- sd(bio17xy, na.rm = T)
  
  bio17_LGMxy <- extract(bio17_LGM, xy)
  bio17_LGM_mean <- mean(bio17_LGMxy, na.rm = T)
  bio17_LGM_sd <- sd(bio17_LGMxy, na.rm = T)
  
  bio17_LIGxy <- extract(bio17_LIG, xy)
  bio17_LIG_mean <- mean(bio17_LIGxy, na.rm = T)
  bio17_LIG_sd <- sd(bio17_LIGxy, na.rm = T)
  
  bio17_Plioxy <- extract(bio17_Plio, xy)
  bio17_Plio_mean <- mean(bio17_Plioxy, na.rm = T)
  bio17_Plio_sd <- sd(bio17_Plioxy, na.rm = T)
  
  bio17_LGM_diff <- bio17_mean - bio17_LGM_mean
  bio17_LIG_diff <- bio17_mean - bio17_LIG_mean
  bio17_Plio_diff <- bio17_mean - bio17_Plio_mean
  
  bio18xy <- extract(bio18, xy)
  bio18_mean <- mean(bio18xy, na.rm = T)
  bio18_sd <- sd(bio18xy, na.rm = T)
  
  bio18_LGMxy <- extract(bio18_LGM, xy)
  bio18_LGM_mean <- mean(bio18_LGMxy, na.rm = T)
  bio18_LGM_sd <- sd(bio18_LGMxy, na.rm = T)
  
  bio18_LIGxy <- extract(bio18_LIG, xy)
  bio18_LIG_mean <- mean(bio18_LIGxy, na.rm = T)
  bio18_LIG_sd <- sd(bio18_LIGxy, na.rm = T)
  
  bio18_Plioxy <- extract(bio18_Plio, xy)
  bio18_Plio_mean <- mean(bio18_Plioxy, na.rm = T)
  bio18_Plio_sd <- sd(bio18_Plioxy, na.rm = T)
  
  bio18_LGM_diff <- bio18_mean - bio18_LGM_mean
  bio18_LIG_diff <- bio18_mean - bio18_LIG_mean
  bio18_Plio_diff <- bio18_mean - bio18_Plio_mean
  
  bio19xy <- extract(bio19, xy)
  bio19_mean <- mean(bio19xy, na.rm = T)
  bio19_sd <- sd(bio19xy, na.rm = T)
  
  bio19_LGMxy <- extract(bio19_LGM, xy)
  bio19_LGM_mean <- mean(bio19_LGMxy, na.rm = T)
  bio19_LGM_sd <- sd(bio19_LGMxy, na.rm = T)
  
  bio19_LIGxy <- extract(bio19_LIG, xy)
  bio19_LIG_mean <- mean(bio19_LIGxy, na.rm = T)
  bio19_LIG_sd <- sd(bio19_LIGxy, na.rm = T)
  
  bio19_Plioxy <- extract(bio19_Plio, xy)
  bio19_Plio_mean <- mean(bio19_Plioxy, na.rm = T)
  bio19_Plio_sd <- sd(bio19_Plioxy, na.rm = T)
  
  bio19_LGM_diff <- bio19_mean - bio19_LGM_mean
  bio19_LIG_diff <- bio19_mean - bio19_LIG_mean
  bio19_Plio_diff <- bio19_mean - bio19_Plio_mean
  
  gdgfgd0xy <- extract(gdgfgd0, xy)
  gdgfgd0_mean <- mean(gdgfgd0xy, na.rm = T)
  gdgfgd0_sd <- sd(gdgfgd0xy, na.rm = T)
  
  gdgfgd5xy <- extract(gdgfgd5, xy)
  gdgfgd5_mean <- mean(gdgfgd5xy, na.rm = T)
  gdgfgd5_sd <- sd(gdgfgd5xy, na.rm = T)
  
  gdgfgd10xy <- extract(gdgfgd10, xy)
  gdgfgd10_mean <- mean(gdgfgd10xy, na.rm = T)
  gdgfgd10_sd <- sd(gdgfgd10xy, na.rm = T)
  
  gslxy <- extract(gsl, xy)
  gsl_mean <- mean(gslxy, na.rm = T)
  gsl_sd <- sd(gslxy, na.rm = T)
  
  gspxy <- extract(gsp, xy)
  gsp_mean <- mean(gspxy, na.rm = T)
  gsp_sd <- sd(gspxy, na.rm = T)
  
  gstxy <- extract(gst, xy)
  gst_mean <- mean(gstxy, na.rm = T)
  gst_sd <- sd(gstxy, na.rm = T)
  
  lgdxy <- extract(lgd, xy)
  lgd_mean <- mean(lgdxy, na.rm = T)
  lgd_sd <- sd(lgdxy, na.rm = T)
  
  fgdxy <- extract(fgd, xy)
  fgd_mean <- mean(fgdxy, na.rm = T)
  fgd_sd <- sd(fgdxy, na.rm = T)
  
  kg2xy <- extract(kg2, xy)
  kg2_mean <- mean(kg2xy, na.rm = T)
  kg2_sd <- sd(kg2xy, na.rm = T)
  
  scdxy <- extract(scd, xy)
  scd_mean <- mean(scdxy, na.rm = T)
  scd_sd <- sd(scdxy, na.rm = T)
  
  swexy <- extract(swe, xy)
  swe_mean <- mean(swexy, na.rm = T)
  swe_sd <- sd(swexy, na.rm = T)
  
  nppxy <- extract(npp, xy)
  npp_mean <- mean(nppxy, na.rm = T)
  npp_sd <- sd(nppxy, na.rm = T)
  
  globCoverxy <- extract(globCover, xy)
  globCover_mean <- mean(globCoverxy, na.rm = T)
  globCover_sd <- sd(globCoverxy, na.rm = T)
  
  GDEMxy <- extract(GDEM, xy)
  GDEM_mean <- mean(GDEMxy, na.rm = T)
  GDEM_sd <- sd(GDEMxy, na.rm = T)
  
  gdpxy <- extract(gdp, xy)
  gdp_mean <- mean(gdpxy, na.rm = T)
  gdp_sd <- sd(gdpxy, na.rm = T)
  
  gpwxy <- extract(gpw, xy)
  gpw_mean <- mean(gpwxy, na.rm = T)
  gpw_sd <- sd(gpwxy, na.rm = T)

  fi_averagexy <- extract(fi_average, xy)
  fi_average_mean <- mean(fi_averagexy, na.rm = T)
  fi_average_sd <- sd(fi_averagexy, na.rm = T)
  
  fl_riskxy <- extract(fl_risk, xy)
  fl_risk_mean <- mean(fl_riskxy, na.rm = T)
  fl_risk_sd <- sd(fl_riskxy, na.rm = T)
  
  dr_eventsxy <- extract(dr_events, xy)
  dr_events_mean <- mean(dr_eventsxy, na.rm = T)
  dr_events_sd <- sd(dr_eventsxy, na.rm = T)
  
  anthxy <- extract(anth, xy)
  anth_mean <- mean(anthxy, na.rm = T)
  anth_sd <- sd(anthxy, na.rm = T)
  
  GloRiCxy <- extract(GloRiC, xy)
  GloRiC_mean <- mean(GloRiCxy)
  GloRiC_sd <- sd(GloRiCxy)
  
  GLWD_1xy <- extract(GLWD_1, xy)
  GLWD_1_mean <- mean(GLWD_1xy, na.rm = T)
  GLWD_1_sd <- sd(GLWD_1xy, na.rm = T)
  
  GLWD_2xy <- extract(GLWD_2, xy)
  GLWD_2_mean <- mean(GLWD_2xy, na.rm = T)
  GLWD_2_sd <- sd(GLWD_2xy, na.rm = T)
  
  cvxy <- extract(cv, xy)
  cv_mean <- mean(cvxy, na.rm = T)
  cv_sd <- sd(cvxy, na.rm = T)
  
  shannonxy <- extract(shannon, xy)
  shannon_mean <- mean(shannonxy, na.rm = T)
  shannon_sd <- sd(shannonxy, na.rm = T)
  
  
  
  #ADD ALL OTHER DATA LAYERS
  
  
  #write data to file
  write.table(data.frame(Ecoregion, area, lat_mean, lat_min, lat_max, lat_length, lon_mean, lon_min, 
                         lon_max, lon_length, bio1_mean, bio1_sd, bio2_mean, bio2_sd, 
                         bio3_mean, bio3_sd, bio4_mean, bio4_sd, bio5_mean, bio5_sd, 
                         bio6_mean, bio6_sd, bio7_mean, bio7_sd, bio8_mean, bio8_sd, 
                         bio9_mean, bio9_sd,bio10_mean, bio10_sd, bio11_mean, bio11_sd, 
                         bio12_mean, bio12_sd, bio13_mean, bio13_sd, bio14_mean, bio14_sd, 
                         bio15_mean, bio15_sd, bio16_mean, bio16_sd, bio17_mean, bio17_sd, 
                         bio18_mean, bio18_sd, bio19_mean, bio19_sd, gdgfgd0_mean, gdgfgd0_sd, 
                         gdgfgd5_mean, gdgfgd5_sd, gdgfgd10_mean, gdgfgd10_sd, gsl_mean, gsl_sd, 
                         gsp_mean, gsp_sd, gst_mean, gst_sd, lgd_mean, lgd_sd, fgd_mean, fgd_sd, 
                         kg2_mean, kg2_sd, scd_mean, scd_sd, swe_mean, swe_sd, npp_mean, npp_sd, 
                         globCover_mean, globCover_sd, GDEM_mean, GDEM_sd, gdp_mean, gdp_sd, 
                         gpw_mean, gpw_sd, fi_average_mean, fi_average_sd, fl_risk_mean, fl_risk_sd, 
                         dr_events_mean, dr_events_sd, anth_mean, anth_sd, GloRiC_mean, GloRiC_sd,
                         GLWD_1_mean, GLWD_1_sd, GLWD_2_mean, GLWD_2_sd, cv_mean, cv_sd, 
                         shannon_mean, shannon_sd, bio1_LGM_mean, bio1_LGM_sd, bio1_LGM_diff,
                         bio1_LIG_mean, bio1_LIG_sd, bio1_LIG_diff, bio1_Plio_mean, bio1_Plio_sd, 
                         bio1_Plio_diff, bio2_LGM_mean, bio2_LGM_sd, bio2_LGM_diff,
                         bio2_LIG_mean, bio2_LIG_sd, bio2_LIG_diff, bio3_LGM_mean, 
                         bio3_LGM_sd, bio3_LGM_diff, bio3_LIG_mean, bio3_LIG_sd, 
                         bio3_LIG_diff, bio4_LGM_mean, bio4_LGM_sd, bio4_LGM_diff,
                         bio4_LIG_mean, bio4_LIG_sd, bio4_LIG_diff, bio4_Plio_mean, 
                         bio4_Plio_sd, bio4_Plio_diff, bio5_LGM_mean, bio5_LGM_sd, 
                         bio5_LGM_diff, bio5_LIG_mean, bio5_LIG_sd, bio5_LIG_diff,
                         bio6_LGM_mean, bio6_LGM_sd, bio6_LGM_diff, bio6_LIG_mean, 
                         bio6_LIG_sd, bio6_LIG_diff, bio7_LGM_mean, bio7_LGM_sd, 
                         bio7_LGM_diff, bio7_LIG_mean, bio7_LIG_sd, bio7_LIG_diff,
                         bio8_LGM_mean, bio8_LGM_sd, bio8_LGM_diff, bio8_LIG_mean, 
                         bio8_LIG_sd, bio8_LIG_diff, bio8_Plio_mean, bio8_Plio_sd, 
                         bio8_Plio_diff, bio9_LGM_mean, bio9_LGM_sd, bio9_LGM_diff,
                         bio9_LIG_mean, bio9_LIG_sd, bio9_LIG_diff, bio9_Plio_mean, 
                         bio9_Plio_sd, bio9_Plio_diff, bio10_LGM_mean, bio10_LGM_sd, 
                         bio10_LGM_diff, bio10_LIG_mean, bio10_LIG_sd, bio10_LIG_diff, 
                         bio10_Plio_mean, bio10_Plio_sd, bio10_Plio_diff, bio11_LGM_mean, 
                         bio11_LGM_sd, bio11_LGM_diff, bio11_LIG_mean, bio11_LIG_sd, 
                         bio11_LIG_diff, bio11_Plio_mean, bio11_Plio_sd, bio11_Plio_diff,
                         bio12_LGM_mean, bio12_LGM_sd, bio12_LGM_diff, bio12_LIG_mean, 
                         bio12_LIG_sd, bio12_LIG_diff, bio12_Plio_mean, bio12_Plio_sd, 
                         bio12_Plio_diff, bio13_LGM_mean, bio13_LGM_sd, bio13_LGM_diff,
                         bio13_LIG_mean, bio13_LIG_sd, bio13_LIG_diff, bio13_Plio_mean, 
                         bio13_Plio_sd, bio13_Plio_diff, bio14_LGM_mean, bio14_LGM_sd, 
                         bio14_LGM_diff, bio14_LIG_mean, bio14_LIG_sd, bio14_LIG_diff, 
                         bio14_Plio_mean, bio14_Plio_sd, bio14_Plio_diff, bio15_LGM_mean, 
                         bio15_LGM_sd, bio15_LGM_diff, bio15_LIG_mean, bio15_LIG_sd, 
                         bio15_LIG_diff, bio15_Plio_mean, bio15_Plio_sd, bio15_Plio_diff,
                         bio16_LGM_mean, bio16_LGM_sd, bio16_LGM_diff, bio16_LIG_mean, 
                         bio16_LIG_sd, bio16_LIG_diff, bio16_Plio_mean, bio16_Plio_sd, 
                         bio16_Plio_diff, bio17_LGM_mean, bio17_LGM_sd, bio17_LGM_diff,
                         bio17_LIG_mean, bio17_LIG_sd, bio17_LIG_diff, bio17_Plio_mean, 
                         bio17_Plio_sd, bio17_Plio_diff, bio18_LGM_mean, bio18_LGM_sd, 
                         bio18_LGM_diff, bio18_LIG_mean, bio18_LIG_sd, bio18_LIG_diff, 
                         bio18_Plio_mean, bio18_Plio_sd, bio18_Plio_diff, bio19_LGM_mean, 
                         bio19_LGM_sd, bio19_LGM_diff, bio19_LIG_mean, bio19_LIG_sd, 
                         bio19_LIG_diff, bio19_Plio_mean, bio19_Plio_sd, bio19_Plio_diff), 
              file="bat_env_geo.csv", quote=FALSE, row.names=FALSE, col.names=!file.exists("bat_env_geo.csv"), append=T, sep=",")

}
