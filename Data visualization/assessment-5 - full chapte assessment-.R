options(digits = 3)    # report 3 significant digits
install.packages("titanic")
library(tidyverse)
library(titanic)
library(dslabs)
library(dplyr)
library(ggplot2)
library(ggthemes)

titanic <- titanic_train %>%
  select(Survived, Pclass, Sex, Age, SibSp, Parch, Fare) %>%
  mutate(Survived = factor(Survived),
         Pclass = factor(Pclass),
         Sex = factor(Sex))


#Question 2: Demographics of Titanic Passengers

titanic %>%
  ggplot(aes(Age, fill = Sex)) + geom_density(alpha = 0.2) 
#+  facet_grid(Sex~.) 
  
titanic %>%
  ggplot(aes(Age, fill = Sex)) + geom_histogram(alpha = 0.2) + 
  facet_grid(Sex~.) 

titanic %>%
  ggplot(aes(Age, fill = Sex)) + geom_density() + 
facet_grid(Sex~.) 

titanic %>%
  ggplot(aes(Age)) + geom_histogram() +
facet_grid(Sex~.) 


#Question 3: QQ-plot of Age Distribution
params <- titanic %>%
  filter(!is.na(Age)) %>%
  summarize(mean = mean(Age), sd = sd(Age))

titanic %>% ggplot(aes(sample = Age)) + 
  geom_qq(dparams = params) +
  geom_abline()


#Question 4: Survival by Sex
#we can see that most of the female survived 
#there were more female that survived than man

titanic %>% ggplot(aes(Sex, fill = Survived)) + geom_bar()


#Question 5: Survival by Age
titanic %>% ggplot(aes(Age, stat(count), fill = Survived)) + geom_density(alpha = 0.2) 



#Question 6: Survival by Fare
titanic %>% filter(!Fare==0) %>%
  ggplot(aes(Survived, Fare)) + 
  geom_boxplot() + 
  scale_y_continuous(trans = "log2") + 
  geom_jitter(width = 0.1, alpha = 0.2)
  


#Question 7: Survival by Passenger Class
#bar plots stats 
titanic  %>%
  ggplot(aes(Pclass, fill = Survived)) + geom_bar()

#bar plots with proportions
titanic  %>%
  ggplot(aes(Pclass, fill = Survived)) + geom_bar(position = position_fill())

titanic  %>%
  ggplot(aes(Survived, fill = Pclass)) + geom_bar(position = position_fill())


#Question 8: Survival by Age, Sex and Passenger Class

titanic %>%
  ggplot(aes(Age, stat(count), fill = Survived)) + geom_density(alpha = 0.2) + 
  facet_grid(Sex~Pclass) 

