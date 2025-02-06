#load libraries
library(ggplot2)
library(tools)
library(CoordinateCleaner)
library(raster)
library(RColorBrewer)
library(viridis)


#import all data and label as species
myfiles <- list.files(pattern = "occurrences.txt", full.names=TRUE, recursive = TRUE)

df_all = data.frame()

for (f in myfiles) {
  
  #get species and gene name
  sp <- basename(dirname(f))
  
  occurrences <- read.delim(f)
  xy <- occurrences[,c(5:4)]
  info <- cbind(sp,xy)
  df_all <- rbind(df_all,info)
  
}


df_clean <- cc_outl(df_all, lon = "longitude", lat = "latitude", species = "sp")
xy_clean <- df_clean[,c(2:3)]


#get world polygon
world<-map_data("world")

#rasterize points
r<-raster()

all_r<-rasterize(xy_clean, r, fun='count')

#ignore this for now - we might log it if there is too much and it's hard to see
#all_r<-rasterize(xy_clean, r, fun=function(x,...)length(log(x)))

map_all <- rasterToPoints(all_r)
df <- data.frame(map_all)
colnames(df) <- c('Longitude', 'Latitude', 'logN')

ggplot() +
  geom_polygon(data = world, aes(x=long, y=lat, group=group), fill="lightgrey", color="gray30", size = 0.05) +
  geom_tile(data=df, aes(y=Latitude, x=Longitude, fill=logN)) +
  scale_fill_gradientn(colors = hcl.colors(20, "OrRd"), trans="log") +
  xlab("Longitude") +
  ylab("Latitude") +
  coord_quickmap() +
  theme(legend.text=element_text(size=7), legend.key.size = unit(0.5, "cm"),
        legend.key.width = unit(0.4,"cm"))


g <- ggplot() +
  geom_polygon(data = world, aes(x=long, y=lat, group=group), fill="lightgrey", color="gray30", size = 0.05) +
  geom_tile(data=df, aes(y=Latitude, x=Longitude, fill=logN)) +
  scale_fill_gradientn(colors = hcl.colors(20, "OrRd"), trans="log") +
  xlab("Longitude") +
  ylab("Latitude") +
  coord_quickmap() +
  theme(legend.text=element_text(size=3), legend.title=element_text(size=5), legend.key.size = unit(0.25, "cm"), legend.key.width = unit(0.25,"cm"), axis.text=element_text(size=5), axis.title=element_text(size=7))

tiff(file="batmap0.tiff", units="in", width=5, height=3, res=300)
g
dev.off()



g <- ggplot() +
  geom_polygon(data = world, aes(x=long, y=lat, group=group), fill="lightgrey", color="gray30", size = 0.05) +
  geom_tile(data=df, aes(y=Latitude, x=Longitude, fill=logN)) +
  scale_fill_viridis_c(option = "plasma", trans="log") +
  xlab("Longitude") +
  ylab("Latitude") +
  coord_quickmap()

tiff(file="batmap1.tiff", units="in", width=5, height=3, res=300)
g
dev.off()


g <- ggplot() +
  geom_polygon(data = world, aes(x=long, y=lat, group=group), fill="lightgrey", color="gray30", size = 0.05) +
  geom_tile(data=df, aes(y=Latitude, x=Longitude, fill=logN)) +
  scale_fill_gradientn(colors = hcl.colors(20, "OrRd"), trans="log") +
  xlab("Longitude") +
  ylab("Latitude") +
  coord_quickmap()

tiff(file="batmap2.tiff", units="in", width=5, height=3, res=300)
g
dev.off()


g <- ggplot() +
  geom_polygon(data = world, aes(x=long, y=lat, group=group), fill="lightgrey", color="gray30", size = 0.05) +
  geom_tile(data=df, aes(y=Latitude, x=Longitude, fill=logN)) +
  scale_fill_gradientn(colors = hcl.colors(20, "Dark2"), trans="log") +
  xlab("Longitude") +
  ylab("Latitude") +
  coord_quickmap()

tiff(file="batmap3.tiff", units="in", width=5, height=3, res=300)
g
dev.off()



g <- ggplot() +
  geom_polygon(data = world, aes(x=long, y=lat, group=group), fill="lightgrey", color="gray30", size = 0.05) +
  geom_tile(data=df, aes(y=Latitude, x=Longitude, fill=logN)) +
  scale_fill_gradientn(colors = hcl.colors(100, "Dark2")) +
  xlab("Longitude") +
  ylab("Latitude") +
  coord_quickmap()

tiff(file="batmap3_nottransformed.tiff", units="in", width=5, height=3, res=300)
g
dev.off()