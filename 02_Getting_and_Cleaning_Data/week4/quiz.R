## 4-1
# setwd("F:\\CS\\R\\Getting_and_Cleaning_Data\\week4")
# url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
# download.file(url, "data1.csv")
data1 <- read.csv("./data1.csv")
ss <- strsplit(names(data1), "wgtp")
ss[123]

## 4-2
# url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
# download.file(url, "data2.csv")
data2 <- read.csv("./data2.csv", colClasses = "character")
gdp <- as.numeric(gsub(",", "", data2$X.3[5:194]))
mean(gdp)

## 4-3
table(grepl("^United", data2$X.2))

## 4-4
# url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
# download.file(url, "data4.csv")
data4 <- read.csv("./data4.csv")
gdp <- data2[5:194, c(1,2,4,5)]
colnames(gdp) <- c("CountryCode", "Ranking", "Economy", "GDP")
mergedata <- merge(gdp, data4, by.x = "CountryCode", by.y = "CountryCode", all = T)
SpecialNote <- mergedata[, 13]
length(grep("Fiscal year end: June", SpecialNote))

# 4-5
library(quantmod)
library(lubridate)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
bool1 <- year(sampleTimes) == 2012
length(sampleTimes[bool1])
bool2 <- weekdays(sampleTimes) == "星期一"
length(sampleTimes[bool1 & bool2])