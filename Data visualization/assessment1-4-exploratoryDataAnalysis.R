#Exercise 1. Exploring the Galton Dataset - Average and Median
#For this chapter, we will use height data collected 
#by Francis Galton for his genetics studies. Here we 
#just use height of the children in the dataset:

#install.packages("HistData")
library(HistData)
data(Galton)
x <- Galton$child
mean(x)
median(x)

#Exercise 2. Exploring the Galton Dataset - SD and MAD
#Now for the same data compute the standard deviation and the median absolute deviation (MAD).

library(HistData)
data(Galton)
x <- Galton$child
sd(x)
mad(x)

#Exercise 3. Error impact on average
#In the previous exercises we saw that
#the mean and median are very similar 
#and so are the standard deviation and 
#MAD. This is expected since the data is 
#approximated by a normal distribution which has this property.
#Now suppose that Galton made a mistake when entering the first value, forgetting to use the decimal point. You can imitate this error by typing:
  
library(HistData)
data(Galton)
x <- Galton$child
x_with_error <- x
x_with_error[1] <- x_with_error[1]*10
mean(x_with_error)-mean(x)
  
#Exercise 4. Error impact on SD
#In the previous exercise we saw how a simple mistake in 1 
#out of over 900 observations can result in the average of 
#our data increasing more than half an inch, which is a large
#difference in practical terms. Now let's explore the effect 
#this outlier has on the standard deviation.

library(HistData)
data(Galton)
x <- Galton$child
x_with_error <- x
x_with_error[1] <- x_with_error[1]*10
sd(x_with_error) - sd(x)


#Exercise 5. Error impact on median
#In the previous exercises we saw how
#one mistake can have a substantial effect
#on the average and the standard deviation.
#Now we are going to see how the median and 
#MAD are much more resistant to outliers.
#For this reason we say that they are robust summaries.

library(HistData)
data(Galton)
x <- Galton$child
x_with_error <- x
x_with_error[1] <- x_with_error[1]*10
median(x_with_error) - median(x)

#Exercise 6. Error impact on MAD
#We saw that the median barely changes. 
#Now let's see how the MAD is affected.
#Report how many inches the MAD grows
#after the mistake. Specifically, report
#the difference between the MAD of the data 
#with the mistake x_with_error and the data 
#without the mistake x.

library(HistData)
data(Galton)
x <- Galton$child
x_with_error <- x
x_with_error[1] <- x_with_error[1]*10
mad(x_with_error) - mad(x)


#Exercise 7. Usefulness of EDA
#How could you use exploratory data analysis to detect 
#that an error was made?
#Possible Answers
#1-Since it is only one value out of many, we will not be able to detect this.
#2-We would see an obvious shift in the distribution.
# 3-(GOOD ANSWER) A boxplot, histogram, or qq-plot would reveal a clear outlier.
#4-A scatter plot would show high levels of measurement error.


#Exercise 8. Using EDA to explore changes
#We have seen how the average can be affected 
#by outliers. But how large can this effect get? 
#This of course depends on the size of the outlier 
#and the size of the dataset.
# see how outliers can affect the average of a dataset, let's write a simple function that takes the size of the outlier as input and returns the average.
#Write a function called error_avg that takes 
#a value k and returns the average of the vector
#x after the first entry changed to k. Show the 
#results for k=10000 and k=-10000.

library(HistData)
data(Galton)

x <- Galton$child
error_avg <- function(k){
  x_with_error <- x
  x_with_error[1] <- k
  mean(x_with_error)
}
error_avg(10000)
error_avg(-10000)

