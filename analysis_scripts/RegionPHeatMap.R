library(maptools)
library(sp)
library(raster)
library(ggplot2)
library(RColorBrewer)
library(tools)

#import PD data
PDvalues <- read.csv("pd_161-NoNA.csv")

#import first shapefile and add the PD value
shp <- readShapePoly("Ecoregions_selected_161/Alai-Western Tian Shan steppe.shp")
shp$PD <- PDvalues$mpd[PDvalues$eco %in% "Alai-Western Tian Shan steppe"]

#create a list of polygon file paths (all but the one already imported above)
myfiles <- list.files(path = "Ecoregions_selected_161_minusOne", pattern = ".shp", full.names=T, recursive = TRUE)

#loop through the list
for (poly in myfiles){
  
  p <- file_path_sans_ext(basename(poly))
  
  if (p %in% PDvalues$eco) {
    #import the file
    shp2 <- readShapePoly(poly)
    #add the pd value
    shp2$PD <- PDvalues$mpd[PDvalues$eco %in% p]
    #combine files
    shp <- bind(shp, shp2)
  }
  
}
plot(shp)
S

## no dropping of projection metadata
r <- raster(shp,nrows=1000,ncols=1500)

r <- rasterize(shp,r,field = shp$PD, fun="first")
plot(shp,border="grey")
plot(r, add=TRUE)
projection(r)

writeRaster(r, "EcoPDRaster_FINAL_fam_109.tiff")

st_write(shp, "mergedShpfile.shp", driver - "ESRI Shapefile")