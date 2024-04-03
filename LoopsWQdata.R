#Mikaila Reynolds
#Loops! With my water quality station data 



WQdata <- read.csv(file.choose())
str(WQdata)
names(WQdata)

#AreaSite 8 - chr, Fecal_SSM 40- num

WQSub <- WQdata[,c(3,8,40)]

#unique(WQSub$AreaSite)

WQSub <- na.omit(WQSub)
nrow(WQSub)

str(WQSub)
str(WQSub$Fecal_SSM)
mean(WQSub$Fecal_SSM)
max(WQSub$Fecal_SSM)
min(WQSub$Fecal_SSM) #odd... mean is 44, max is 1600... large rain events? 

mean(WQdata$Precipitation_24hr)
max(WQdata$Precipitation_24hr)
min(WQdata$Precipitation_24hr)

hist(WQSub$Fecal_SSM)

#unique(SubID$month)


unique.AS <- unique(WQSub$AreaSite) #lists all unique AreaSites
unique.AS


mean.Fec <- c() #makes empty vector for data 
summary.Fec <- c() #makes empty vector for data 

plot(x=WQSub$Year, y=WQSub$Fecal_SSM, type="p", las=1)
?plot

plot(x=WQdata$Precipitation_24hr, y=WQdata$Fecal_SSM, type="p", las=1)
plot(x=WQdata$Salinity, y=WQdata$Fecal_SSM, type="p", las=1)

for (i in 1:length(unique.AS)){
  unique.years <- c()
  unique.years<-(unique(WQSub[WQSub$AreaSite==unique.AS[i],]$Year))
  summary.Fec<-c()
  
  for (j in 1:length(unique.years)){
    mean.Fec <-   mean(WQSub[WQSub$AreaSite==unique.AS[i]&WQSub$Year==unique.years[j],]$Fecal_SSM)
    summary.Fec <- c(summary.Fec, mean.Fec)
    
    
  }
  
  
  lines(x=unique.years, y=summary.Fec)
  
  
}


#########

UnYears <- unique(WQSub[WQSub$AreaSite==unique.AS[i],]$Year)
UnYears


length(mean.Fec)


mean(WQSub[WQSub$AreaSite=="C1",]$Fecal_SSM)


Means <- summary(WQSub$Fecal_SSM)[4]
Means


#WQSub$unique.quad.id <- interaction(SubIDjune$site, SubIDjune$quad)
#head(SubIDjune$unique.quad.id)
