library(dslabs)
data(heights)
x <- heights$height[heights$sex == "Male"]
mean(x>69 & x<=72) 


library(dslabs)
data(heights)
x <- heights$height[heights$sex=="Male"]
avg <- mean(x)
stdev <- sd(x)
pnorm(72, avg, stdev) - pnorm(69, avg, stdev)


library(dslabs)
data(heights)
x <- heights$height[heights$sex == "Male"]
exact <- mean(x > 79 & x <= 81)
approx <- pnorm(81, mean(x), sd(x)) - pnorm(79, mean(x), sd(x))
exact/approx


#???proportion of people taller than 7 feets (7 feets = 7*12inches), knowing that human avg heigh is 69 and std dev is 3
# use pnorm to calculate the proportion over 7 feet (7*12 inches)
1-pnorm(7*12, 69, 3)



p <- 1 - pnorm(7*12, 69, 3)
round(p*10^9)


#Use your answer to exercise 4 to estimate the proportion of men that are seven feet tall or taller in the world and store that value as p.
#Use your answer to the previous exercise (exercise 5) to round the number of 18-40 year old men who are seven feet tall or taller to the nearest integer and store that value as N.
#Then calculate the proportion of the world's 18 to 40 year old seven footers that are in the NBA. (Do not store this value in an object.)

p <- 1 - pnorm(7*12, 69, 3)  
N <- round(p * 10^9)
N
10/N


## Change the solution to previous answer (with lebron james inches 6feets8inchs , they are about 150 in NBA with that measurements)
p <- 1 - pnorm(6*12+8, 69, 3)
N <- round(p * 10^9)  
150/N