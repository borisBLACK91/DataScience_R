#Exercise 1. Vector lengths
#When analyzing data it's often important to know the number of measurements you have for each category.

library(dslabs)
data(heights)
male <- heights$height[heights$sex=="Male"]
female <- heights$height[heights$sex=="Female"]
length(male)
length(female)


#Exercise 2. Percentiles
#Suppose we can't make a plot and want to compare the distributions side by side. If the number of data points is large, listing all the numbers is inpractical. A more practical approach is to look at the percentiles. We can obtain percentiles using the quantile function like this

library(dslabs)
data(heights)
male <- heights$height[heights$sex=="Male"]
female <- heights$height[heights$sex=="Female"]
female_percentiles <-quantile(female, seq(0.1, 0.9, 0.2))
male_percentiles <- quantile(male, seq(0.1, 0.9, 0.2))
df <- data.frame(female = female_percentiles, male = male_percentiles)
df
#male_percentiles <- quantile(male, seq(0.01, 0.99, 0.01))
