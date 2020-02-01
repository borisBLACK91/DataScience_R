library(dslabs)
data(heights)
names(heights)
head(heights)
x <- c(3, 3, 3, 3, 4, 4, 2)
unique(x)
x <- heights$height
tab <- table(x)
tab
str(tab)
sum(ifelse(tab!=1, 0, tab))
