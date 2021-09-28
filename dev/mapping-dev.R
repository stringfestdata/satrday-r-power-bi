library(usmap)
library(ggplot2)

# Lat/Lon of Sioux Falls, SD
test_data <- data.frame(lon = -82.98, lat = 39.98)

transformed_data <- usmap_transform(test_data)

plot_usmap('counties', color = 'blue', fill = 'lightgray', include = 'OH') + 
  geom_point(data = transformed_data, aes(x = lon.1, y = lat.1)) + 
  labs(title = 'satRday Columbus')


