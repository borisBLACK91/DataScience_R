install.packages("dslabs")
library(dslabs)
murder_rate <- (murders$total/murders$population)*100000 
safe <- murder_rate<=1
west <- murders$region=="West"
index <- safe & west
sum(index)
murders$state[index]
which(index)