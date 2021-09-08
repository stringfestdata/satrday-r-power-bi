library(rnoaa)

ncdc_stations()


# Find a station at https://www.ncdc.noaa.gov/cdo-web/datatools/findstation

View(ncdc_stations(stationid='GHCND:USW00014821')$data)

