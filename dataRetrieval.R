### Daily Data Retrival

# Mexican Data
## Builds the File Name
### Gets Today's Date
datTod <- Sys.Date()
### Gets the Year
yea <- sub(paste('.+(?=.{', 2, '})', sep=''), '', year(datTod), perl=T)
### Gets the Month
mon <- month(datTod)
if(mon < 10){
  mon <- paste0("0",mon)
}
### Gets the Day of the Month
dayMon <- mday(datTod)
if(dayMon < 10){
  dayMon <- paste0("0", dayMon)
}
### Builds the CSV file name
filNam <- paste0('./tem2/',yea, mon, dayMon, 'COVID19MEXICO.csv')

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