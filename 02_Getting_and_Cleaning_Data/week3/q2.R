library(jpeg)
jpg<-readJPEG(source="getdata-jeff.jpg",native=TRUE)
quantile(jpg,probs = c(.3,.8))