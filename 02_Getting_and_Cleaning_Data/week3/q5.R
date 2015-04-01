breaks <- quantile(mergedata$Rank, probs = seq(0, 1, 0.2), na.rm = TRUE)
mergedata$quantileGDP <- cut(mergedata$Rank, breaks = breaks)
mergedata[Income.Group == "Lower middle income", .N, by = c("Income.Group", "quantileGDP")]
