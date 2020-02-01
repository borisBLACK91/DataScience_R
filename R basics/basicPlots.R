#install.packages("dplyr")
library(dplyr)
#install.packages("dslabs")
library(dslabs)

murders <- mutate(murders, rate = total/population*100000)
str(murders)
population_in_million <- murders$population/10^10
total_guns_murder <- murders$total
plot(population_in_million, total_guns_murder)