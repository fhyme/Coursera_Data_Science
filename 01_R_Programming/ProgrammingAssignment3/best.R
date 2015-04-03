options(warn=-1)
best <- function(state, outcome){
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death rate
  ocm <- read.csv("./outcome-of-care-measures.csv", colClasses = "character")
  if(!state %in% ocm$State){
    stop("invalid state")
  }
  ValidOutcome <- c("heart attack", "heart failure", "pneumonia")
  if(!outcome %in% ValidOutcome){
    stop("invalid outcome")
  }
  ocm[,11] <- as.numeric(ocm[,11]) #Heart.Attack
  ocm[,17] <- as.numeric(ocm[,17]) #Heart.Failure
  ocm[,23] <- as.numeric(ocm[,23]) #Pneumonia
  if(outcome == "heart attack"){
    return(BestHName(ocm, state, 11))
  }
  else if(outcome == "heart failure"){
    return(BestHName(ocm, state, 17))
  }
  else{
    return(BestHName(ocm, state, 23))
  }
}

BestHName <- function(data, state, col){
  sub <- data[data$State == state, ]
  min <- min(sub[, col], na.rm=T)
  index <- which(sub[, col] == min)
  return(sub[index, 2])
}

# best("TX", "heart attack")
# best("TX", "heart failure")
# best("MD", "heart attack")
# best("MD", "pneumonia")
# best("BB", "heart attack")
# best("NY", "hert attack")
