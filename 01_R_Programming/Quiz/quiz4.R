##quiz 4-1
set.seed(1)
rpois(5,2)


## quiz 4-5
set.seed(10)
x <- rbinom(10, 10, 0.5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e

## solve the problem of RStudio
# Error in RStudioGD() ...
sessionInfo()
capabilities()
png()
dev.off()
x11()
Sys.getenv("DISPLAY")
plot(x,y)