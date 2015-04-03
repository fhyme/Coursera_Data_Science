pollutantmean <- function(directory, pollutant, id = 1:332) {
  FileList <- list.files(path = directory, full.names=TRUE, pattern="*.csv")
  FilePath <- FileList[id]
  csvdata <- vector(mode = "list", length = length(FilePath))
  csvdata <- lapply(FilePath, read.csv)
  DataFrame <- data.frame()
  DataFrame <- do.call(rbind, csvdata)
  if (pollutant == "sulfate") {
    Mean <- mean(DataFrame$sulfate,na.rm=TRUE)
  } else {
    Mean <- mean(DataFrame$nitrate,na.rm=TRUE)
  }
  return (round(Mean, 3))
}