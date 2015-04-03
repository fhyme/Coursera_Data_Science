corr <- function(directory, threshold = 0) {
  source ("complete.R")
  completeObs <- complete (directory)
  subObs <- subset(completeObs, nobs > threshold, select = c(id))
  FileList <- list.files(path = directory, full.names=TRUE, pattern="*.csv")
  FilePath <- FileList[as.integer(unlist(subObs))]
  corVector <- vector(mode = "numeric")
  if (length(FilePath)) {
    for (i in 1:length(FilePath)) {
      tmp <- read.csv(FilePath[i])
      corVector <- c(corVector, cor(tmp$sulfate, tmp$nitrate, use = "complete.obs"))
    }
  }
  return (corVector)
}