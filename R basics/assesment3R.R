#install.packages("dplyr")
library(dslabs)
data(heights)
options(digits = 3)    # report 3 significant digits
str(heights)

#question 1
mean <-  mean(heights$height)
ind <- which(heights$height>mean)
length(ind)

#question 2
all <- heights$sex[ind]
all
females <- all=="Female"
sum(females)


#question 3
#females <- heights$sex=="Female"
#mean(females)

#question 4a
min(heights$height)

#question 4b
my_min <- min(heights$height)
heights$height
min_height_index <- match(my_min, heights$height)


#question 4c
heights$sex[min_height_index]


#question 5a
max(heights$height)

#question 5b
my_min <- min(heights$height)
my_max <- max(heights$height)
x <- min(heights$height):max(heights$height)

#question 5c
sum(!(x %in% heights$height))

#question 6a
heights2 <- mutate(heights, ht_cm = heights$height*2.54)
heights2$ht_cm[18]


#question 6b
mean(heights2$ht_cm)

#question 7a
females <- filter(heights2, sex=="Female")
females
length(females$sex)

#question 7b
mean(females$ht_cm)

#question 8
library(dslabs)
data(olive)
head(olive)

palmitic_acid <- olive$palmitic
palmitoleic_acid<- olive$palmitoleic
plot(palmitic_acid, palmitoleic_acid)
#there is a positiv linear relashionship between both


#question 9
hist(olive$eicosenoic)
#The most common value of eicosenoic acid is below 0.05%.

#question 10
boxplot(palmitic~region, data=olive)
#Which region has the highest median palmitic acid percentage?
#answer is Souther Italy
#Which region has the most variable palmitic acid percentage?
#answer is Souther Italy