# Filename: create_logo.R (2018-05-08)
#
# TO DO: Create a gecomputation with R logo
#
# Author(s): Jannes Muenchow
#
#**********************************************************
# CONTENTS-------------------------------------------------
#**********************************************************
#
# 1. ATTACH PACKAGES AND DATA
# 2. CREATE LOGO
#
#**********************************************************
# 1 ATTACH PACKAGES AND DATA-------------------------------
#**********************************************************

# attach packages
library("sf")
library("spData")
library("raster")
library("grid")
library("gridBase")
library("gridExtra")
# attach data
rlogo = brick("pres/img/Rlogo.tif")

#**********************************************************
# 2 CREATE LOGO--------------------------------------------
#**********************************************************

world_laea = st_transform(world, 
                          crs = "+proj=laea +x_0=0 +y_0=0 +lon_0=-77 +lat_0=39")
gr = st_graticule(ndiscr = 1000) %>%
  st_transform("+proj=laea +y_0=0 +lon_0=-77 +lat_0=39 +ellps=WGS84 +no_defs")
# plot(gr$geometry, col = "lightgray", lwd = 6)
# plot(world_laea$geom, bg = "white", col = "lightgray", add = TRUE)

# grid code found here:
# browseURL("https://stat.ethz.ch/pipermail/r-help//2009-March/419787.html")

graphics.off()
png("pres/img/geocomp_logo.png", res = 300, width = 6, height = 6,
    units = "cm")
plot.new()
pushViewport(viewport(x = 0, y = 0, width = 1, height = 1,
                      just = c(0, 0), name = 'base'))
pushViewport(viewport(x = 0, y = 0.3,
                      width = 0.7, height = 0.7,
                      just = c(0, 0)))
# CHANGE
par(mar = rep(0, 4), xaxs = 'i', yaxs = 'i')
par(new = TRUE, fig = gridFIG())

# plot in top half of page
plot(st_geometry(gr), col = "lightgray", lwd = 1)
plot(st_geometry(world_laea), bg = "white", col = "lightgray", add = TRUE)


# get toplevel view
seekViewport("base")

# create lower viewport
pushViewport(viewport(x = 0.48, y = 0, width = 0.5, height = 0.5, 
                      just = c(0, 0)))
par(new = TRUE, fig = gridFIG())
plotRGB(logo)
dev.off()
