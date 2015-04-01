library(data.table)
mergedata <- data.table(mergedata)
mergedata[, mean(Rank, na.rm = TRUE), by=Income.Group]