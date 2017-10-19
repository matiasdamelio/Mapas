library(data.table)
library(ggplot2)
library(stringr)
library(dplyr)

dir<-"C:/Users/mamelio/Documents/Mapas/"
provincias<-list.files(paste(dir,"Coordenadas/",sep = ''))
provinciasdf<-NA

for(i in 1:length(provincias)){
  
  x<-fread(paste(dir,"Coordenadas/",provincias[i],sep = ''))
  
  df<-data.frame(long=x$V2, lat=x$V3, group=i, region=substr(provincias[i],1,nchar(provincias[i])-4))
  
  provinciasdf<-rbind(provinciasdf, df)

}

provinciasdf<-provinciasdf[2:length(provinciasdf$long),]
provinciasdf$order<-c(1:length(provinciasdf$long))

m <- leaflet() %>%
  addTiles() %>%
  addMarkers(lng=174.768, lat=-36.852, popup = "CABA")
m
