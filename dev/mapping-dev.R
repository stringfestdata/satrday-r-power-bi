# Columbus lat/long
library(usmap)
library(ggplot2)

columbus <- usmap_transform(data.frame(lat = 39.98, long=-82.98))


plot_usmap("counties", color = 'blue', fill = 'lightgray', include = c('OH')) +
  geom_point(data = columbus, aes(x = lon.1, y = lat.1)) +
  labs(title = 'satRday Columbus!')

