complete <- function(directory, id = 1:332) {
  FileList <- list.files(path = directory, full.names=TRUE, pattern="*.csv")
  FilePath <- FileList[id]
  DataFrame <- data.frame()
  Col <- c("Date","sulfate", "nitrate","ID")
  for (i in 1:length(FilePath)) {
    tmp <- read.csv(FilePath[i])
    DataFrame <- rbind(DataFrame, c(tmp$ID[1],nrow(tmp[complete.cases(tmp),])))
  }
  colnames(DataFrame) <- c("id", "nobs")
  return (DataFrame)
}