## 2-1.
library(httr)
oauth_endpoints("github")
myapp <- oauth_app("github", "df028593f646b48aa842", "195aec0751a31e4969e05dd583f0f49b024b9961")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
req <- GET("https://api.github.com/rate_limit", config(token = github_token))
stop_for_status(req)
content(req)
# curl -u Access Token:x-oauth-basic "https://api.github.com/users/jtleek/repos"
BROWSE("https://api.github.com/users/jtleek/repos",authenticate("Access Token","x-oauth-basic","basic"))

## 2-4
url <- "http://biostat.jhsph.edu/~jleek/contact.html"
html <- url(url)
sapply(readLines(html)[c(10, 20, 30, 100)], nchar)

## 2-5
dt <- read.fwf(file="./getdata-wksst8110.for",widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4), skip=4)
sum(dt[,4])