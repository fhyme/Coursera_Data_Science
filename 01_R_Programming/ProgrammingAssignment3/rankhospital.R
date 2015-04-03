source('./best.R')
rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
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
  if(num == "best"){
    return(best(state, outcome))
  }else{
    if(outcome == "heart attack"){
      return(rank(ocm, state, 11, num))
    }
    else if(outcome == "heart failure"){
      return(rank(ocm, state, 17, num))
    }
    else{
      return(rank(ocm, state, 23, num))
    }
  }
}

rank <- function(data, state, col, num){
  sub <- data[data$State == state, ]
  rank_col <- sub[, col]
  len <- length(rank_col[complete.cases(rank_col)])
  if(num == "worst"){
    rnum = len
  }else if(num > len){
    return(NA)
  }else{
    rnum = num
  }
  result <- sub[, 2][order(rank_col, sub[, 2])[rnum]]
  return(result)
}
# test
# rankhospital("MN", "heart attack", 5000)
# rankhospital("MD", "heart attack", "worst")
# rankhospital("TX", "heart failure", 4)