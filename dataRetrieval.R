### Daily Data Retrival

# Mexican Data

## Downloads the Data
### URL
urlMex <- "http://187.191.75.115/gobmx/salud/datos_abiertos/datos_abiertos_covid19.zip"
### Auxilary Temporary Files
tem1 <- tempfile()
### Data Download
download.file(url      = urlMex,
              destfile = tem1)
### Data Unzip
unzip(zipfile = tem1,
      exdir   = 'D:/Renos/Documents/covidMexico/tem2')