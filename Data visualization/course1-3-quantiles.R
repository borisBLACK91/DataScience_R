#quantile and qq-plots to verify if normal distribution is a correct approximation of a given distribution

library(dslabs)
data(heights)
x <- heights$height[heights$sex == "Male"]
p <- seq(0.05, 0.95, 0.05)
observed_quantiles <- quantile(x,p)
theoritical_quantiles <- qnorm(p, mean = mean(x), sd = sd(x))
plot(theoritical_quantiles, observed_quantiles)
abline(0,1)

#with standard units 

library(dslabs)
data(heights)
x <- heights$height[heights$sex == "Male"]
p <- seq(0.05, 0.95, 0.05)
z <- (x-mean(x))/sd(x)
observed_quantiles <- quantile(z,p)
theoritical_quantiles <- qnorm(p)
plot(theoritical_quantiles, observed_quantiles)
abline(0,1)

