library(dslabs)
data(heights)

# make a table of category proportions
prop.table(table(heights$sex))

#normal distribution

library(dslabs)
data(heights)
index <- heights$sex=="Male"
x <- heights2$height[index]
average <- mean(x)
SD <- sd(x)
c(average=average, SD=SD)
z <- scale(x)
mean(abs(z)<2)