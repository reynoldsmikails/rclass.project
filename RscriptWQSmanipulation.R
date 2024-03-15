water.data2<-read.csv("D:/R_Class/RScripts/rclass.project/WaterQualityDataCombinedCleaned.csv")
# Mikaila changed to take a look at the data
head(water.data2)
# one more unnecessary edit

#add more things in!
WQScords<-read.csv("D:/R_Class/RScripts/rclass.project/WQSCoordinates.csv")
head(WQScords)

cleanedCords<-WQScords[c(1:3)]
pacman::p_load(dplyr)
#temp<-WQScords%>%select(AreaSite,Latitude,Longitude)

str(cleanedCords)
"D:\R_Class\RScripts\rclass.project\WQSCoordinates.csv"

colnames(water.data2)
#want to update water.data2 with gps coords from WQScords
WQScords<-cleanedCords

#base R
mergedWQSdata <- merge(x=water.data2, y=WQScords, by.x=intersect(water.data2$AreaSite), by.y=intersect(WQScords$AreaSite)) #need to update

water.data2 <-left_join(x=water.data2, y=WQScords, by = join_by("AreaSite" == "AreaSite"))

water.data2$Latitude<as.numeric(water.data2$Latitude)
water.data2$Longitude<as.numeric(water.data2$Longitude)


pacman::p_load(terra)
pacman::p_load(leaflet)

plotWQSpoints<-vect(cbind(water.data2$Longitude, water.data2$Latitude), crs="WGS84")


plotWQS <- plet(plotWQSpoints)
plotWQS

plot(water.data2,"County", col=rainbow(25))
head(water.data2)
