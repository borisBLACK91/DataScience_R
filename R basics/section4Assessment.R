library(dslabs)
data(heights)

#question 1
#Write an ifelse statement that returns 1 if the sex is Female and 2 if the sex is Male.
#What is the sum of the resulting vector?
heights$sex
myVect <- ifelse(heights$sex=='Female', 1, 2)
myVect
sum(myVect)

#question 2
#Write an ifelse statement that takes the height column and returns the height if it is greater than 72 inches and returns 0 otherwise.
#What is the mean of the resulting vector?
val <- ifelse(heights$height>72, heights$height, 0)
val
mean(val)

#Question 3
#2 points possible (graded)
#Write a function inches_to_ft that takes a number of inches x and returns the number of feet. One foot equals 12 inches.
#What is inches_to_ft(144)?
inches_to_ft <- function(n){
  n/12
}

inches_to_ft(144)

lessthan5feet <- ifelse(inches_to_ft(heights$height)<5, 1, 0)
sum(lessthan5feet)
