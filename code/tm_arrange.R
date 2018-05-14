library(sf)
library(spData)
library(tidyverse)
library(tmap)
names(world)
tm_shape(world) +
  tm_polygons("continent")
w1 = .Last.value
w2 = tm_shape(world) +
  tm_polygons("lifeExp", palette = "RdYlBu")
w2
tmap_arrange(w1, w2, ncol = 1)
