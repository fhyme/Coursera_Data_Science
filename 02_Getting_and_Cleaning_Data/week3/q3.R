gdpdata<-read.csv("./getdata-data-GDP.csv",col.names=c("CountryCode", "Rank", "Empty1", "Fullname", "GDP", "Empty3", "Empty4", "Empty5", "Empty6", "Empty7"))
educationdata<-read.csv("./getdata-data-EDSTATS_Country.csv")
mergedata<-merge(gdpdata,educationdata,by.x = "CountryCode",by.y = "CountryCode",all=FALSE)
mergedata$Rank <- gsub(",", "", mergedata$Rank)
mergedata$Rank <- as.numeric(mergedata$Rank)
nrow(mergedata[!is.na(mergedata$Rank),])
mergedata<-mergedata[order(mergedata$Rank, decreasing=TRUE, na.last = TRUE),]
mergedata$Fullname[13]