dt<-read.csv("getdata-data-ss06hid.csv")
agricultureLogical<-(dt$ACR==3 & dt$AGS==6)
which(agricultureLogical)