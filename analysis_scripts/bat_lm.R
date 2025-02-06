
#import data
variable_data <- read.csv("mergedfile_fam.csv")

#take the absolute value of latitude variable
abs_lat <- abs(variable_data$lat_mean)
#mpd ~ lat_mean
mpd_lat_lm <- lm(variable_data$mpd ~ abs_lat)
summary(mpd_lat_lm)
#mntd ~ lat_mean
mntd_lat_lm <- lm(variable_data$mntd ~ abs_lat)
summary(mntd_lat_lm)


#mpd ~ bio2_LIG_diff
mpd_bio2_LIG_diff_lm <- lm(variable_data$mpd ~ variable_data$bio2_LIG_diff)
summary(mpd_bio2_LIG_diff_lm)

#mpd ~ bio8_mean
mpd_bio8_mean_lm <- lm(variable_data$mpd ~ variable_data$bio8_mean)
summary(mpd_bio8_mean_lm)

#mpd ~ bio8_LGM_mean
mpd_bio8_LGM_mean_lm <- lm(variable_data$mpd ~ variable_data$bio8_LGM_mean)
summary(mpd_bio8_LGM_mean_lm)

####################### 109 data #######################

#import data
variable_data <- read.csv("merged_161.csv")

#take the absolute value of latitude variable
abs_lat <- abs(variable_data$lat_mean)
#mpd ~ lat_mean
mpd_lat_lm <- lm(variable_data$mpd ~ abs_lat)
summary(mpd_lat_lm)
#mpd ~ bio8_mean
mpd_bio8_mean_lm <- lm(variable_data$mpd ~ variable_data$bio8_mean)
summary(mpd_bio8_mean_lm)


test <- lm(variable_data$mpd ~ variable_data$lat_mean)
summary(test)

####################### Plots #######################
library(ggplot2)

variable_data <- read.csv("mergedfile_fam.csv")

bio8_25 <- ggplot(variable_data, aes(x=bio8_mean, y=mpd)) +
  geom_point(size=2, color = "gray32") +
  geom_smooth(method=lm, color = "red4") +
  xlab("Wettest Quarter Mean Temp") + ylab("MPD") +
  theme_minimal() + 
  theme(axis.title.x = element_text(vjust = -1, size = 12), 
        axis.title.y = element_text(vjust = 1.5, size = 14)) +
  scale_y_continuous(expand = c(0, 0)) +
  expand_limits(y = 1.1)

ggsave(filename = "bio8_mean_lm_25.tiff", device='tiff', dpi=800)
ggsave(filename = "bio8_mean_lm_25.pdf", device='pdf')

bio8_LGM_25 <- ggplot(variable_data, aes(x=bio8_LGM_mean, y=mpd)) +
  geom_point(size=2, color = "gray32") +
  geom_smooth(method=lm, color = "red4") +
  xlab("LGM Wettest Quarter Mean Temp") + ylab("MPD") +
  theme_minimal() + 
  theme(axis.title.x = element_text(vjust = -1, size = 12), 
        axis.title.y = element_text(vjust = 1.5, size = 14)) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, NA)) +
  expand_limits(y = 1.1)

ggsave(filename = "bio8_LGM_mean_lm_25.tiff", device='tiff', dpi=800)
ggsave(filename = "bio8_LGM_mean_lm_25.pdf", device='pdf')

bio2_LIG_25 <- ggplot(variable_data, aes(x=bio2_LIG_diff, y=mpd)) +
  geom_point(size=2, color = "gray32") +
  geom_smooth(method=lm, color = "red4") +
  xlab("LIG Diurnal Range Mean Difference") + ylab("MPD") +
  theme_minimal() + 
  theme(axis.title.x = element_text(vjust = -1, size = 12), 
        axis.title.y = element_text(vjust = 1.5, size = 14)) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, NA)) +
  expand_limits(y = 1.1)

ggsave(filename = "bio1_LIG_diff_lm_25.tiff", device='tiff', dpi=800)
ggsave(filename = "bio1_LIG_diff_lm_25.pdf", device='pdf')
  
variable_data <- read.csv("merged_161.csv")

lat_109 <- ggplot(variable_data, aes(x=lat_mean, y=mpd)) +
  geom_point(size=2, color = "gray32") +
  geom_smooth(method=lm, color = "red4") +
  xlab("Mean Latitude") + ylab("MPD") +
  theme_minimal() + 
  theme(axis.title.x = element_text(vjust = -1, size = 12), 
        axis.title.y = element_text(vjust = 1.5, size = 14)) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, NA)) +
  expand_limits(y = 1.1)

ggsave(filename = "lat_mean_lm_109.tiff", device='tiff', dpi=800)
ggsave(filename = "lat_mean_lm_109.pdf", device='pdf')

bio8_109 <- ggplot(variable_data, aes(x=bio8_mean, y=mpd)) +
  geom_point(size=2, color = "gray32") +
  geom_smooth(method=lm, color = "red4") +
  xlab("Wettest Quarter Mean Temp") + ylab("MPD") +
  theme_minimal() + 
  theme(axis.title.x = element_text(vjust = -1, size = 12), 
        axis.title.y = element_text(vjust = 1.5, size = 14)) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, NA)) +
  expand_limits(y = 1.1)

ggsave(filename = "bio8_mean_lm_109.tiff", device='tiff', dpi=800)
ggsave(filename = "bio8_mean_lm_109.pdf", device='pdf')

all_lm1 <- ((bio8_25|bio8_LGM_25|bio2_LIG_25)/(lat_109|bio8_109))+
  plot_annotation(tag_levels = 'a', tag_prefix = '(', tag_suffix = ')') #add figure labels
all_lm1 

ggsave(filename = "all_lm_panel_v1.pdf", height = 8, width = 12, 
       units = "in", device = "pdf")
ggsave(filename = "all_lm_panel_v1.tiff", height = 6, width = 9, 
       units = "in", device = "tiff")

all_lm2 <- ((bio8_25|bio8_LGM_25|bio2_LIG_25)/(lat_109|plot_spacer()|bio8_109))+
  plot_annotation(tag_levels = 'a', tag_prefix = '(', tag_suffix = ')') #add figure labels
all_lm2

ggsave(filename = "all_lm_panel_v2.pdf", height = 8, width = 12, 
       units = "in", device = "pdf")
ggsave(filename = "all_lm_panel_v2.tiff", height = 8, width = 12, 
       units = "in", device = "tiff")

lm_25 <- (bio8_25|bio8_LGM_25|bio2_LIG_25)+
  plot_annotation(tag_levels = 'a', tag_prefix = '(', tag_suffix = ')') #add figure labels
lm_25

ggsave(filename = "lm_25_panel.pdf", height = 4, width = 12, 
       units = "in", device = "pdf")
ggsave(filename = "lm_25_panel.tiff", height = 4, width = 12, 
       units = "in", device = "tiff", dpi=800)

lm_109 <- (lat_109|bio8_109)+
  plot_annotation(tag_levels = 'a', tag_prefix = '(', tag_suffix = ')') #add figure labels
lm_109 
ggsave(filename = "lm_109_panel.pdf", height = 4, width = 8, 
       units = "in", device = "pdf")
ggsave(filename = "lm_109_panel.tiff", height = 4, width = 8, 
       units = "in", device = "tiff", dpi=800)
