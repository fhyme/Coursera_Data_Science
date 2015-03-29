## 1-1
data1 <- read.csv("./getdata-data-ss06hid.csv", header=TRUE)
sub <- data1$VAL
sub <- sub[!is.na(sub)]
length(sub[sub == 24])

## 1-3
library(xlsx)
colIndex <- 7:15
rowIndex <- 18:23
dat <- read.xlsx("./getdata-data-DATA.gov_NGAP.xlsx", sheetIndex=1, header=TRUE， colIndex=colIndex, rowIndex=rowIndex)
sum(dat$Zip*dat$Ext,na.rm=T)

## 1-4
library(xml)
doc <- htmlTreeParse("./getdata-data-restaurants.xml", useInternalNodes = TRUE)
rootNode <- xmlRoot(doc)
zipcode <- xpathSApply(rootNode, "//zipcode", xmlValue)
length(zipcode[zipcode == "21231"])

## 1-5
DT <- fread("./getdata-data-ss06pid.csv")
DT[,mean(pwgtp15),by=SEX]
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(mean(DT[DT$SEX==1,]$pwgtp15))+system.time(mean(DT[DT$SEX==2,]$pwgtp15))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(rowMeans(DT)[DT$SEX==1])+system.time(rowMeans(DT)[DT$SEX==2])