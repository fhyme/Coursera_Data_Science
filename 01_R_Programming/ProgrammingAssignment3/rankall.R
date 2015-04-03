rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  ocm <- read.csv("./outcome-of-care-measures.csv", colClasses = "character")
  ValidOutcome <- c("heart attack", "heart failure", "pneumonia")
  if(!outcome %in% ValidOutcome){
    stop("invalid outcome")
  }
  ocm[,11] <- as.numeric(ocm[,11]) #Heart.Attack
  ocm[,17] <- as.numeric(ocm[,17]) #Heart.Failure
  ocm[,23] <- as.numeric(ocm[,23]) #Pneumonia
  state_arr <- sort(unique(ocm[, 7]))
  len <- length(state_arr)
  hospital <- rep("", len)
  for(i in 1:len){
    subocm <- ocm[ocm[, 7] == state_arr[i], ]
    if(outcome == "heart attack"){
      hospital[i] = rank(subocm, state, 11, num)
    }
    else if(outcome == "heart failure"){
      hospital[i] = rank(subocm, state, 17, num)
    }
    else{
      hospital[i] = rank(subocm, state, 23, num)
    }
  }
  result <- data.frame(hospital=hospital, state=state_arr)
  return(result)
}

rank <- function(sub, state, col, num){
  rank_col <- sub[, col]
  len <- length(rank_col[complete.cases(rank_col)])
  if(num == "best"){
    rnum = 1
  }else if(num == "worst"){
    rnum = len
  }else if(num > len){
    return(NA)
  }else{
    rnum = num
  }
  result <- sub[, 2][order(rank_col, sub[, 2])[rnum]]
  return(result)
}