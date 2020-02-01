update.packages()

library(dplyr)
library(ggplot2)
library(ggthemes)
library(tidyverse)
library(dslabs)
data(stars)
options(digits = 3)   # report 3 significant digits


str(stars)

meanMag <-  mean(stars$magnitude)
sdMag <- sd(stars$magnitude)
meanMag
sdMag


#density plots of the magnitude
stars %>% 
  ggplot(aes(magnitude)) + 
  geom_density()

str(stars)

meanTmp <- mean(stars$temp)
sdTmp <- sd(stars$temp)

meanTmp
sdTmp

stars %>% 
  ggplot(aes(temp)) + 
  geom_density()

#starts temperature distribution doesnt 
#follow a normal distribution


stars %>% 
  ggplot(aes(temp, magnitude)) + 
  geom_point()


#flipping x axis  and y axis as astronomers do we 
#obtain the foillowing plot

stars %>% 
  ggplot(aes(temp, magnitude)) + 
  geom_point() +
  geom_text(aes(temp, magnitude, label = star)) +
  scale_x_log10() +
  scale_x_reverse() + 
  scale_y_reverse() 

stars %>% 
  ggplot(aes(temp, magnitude, color = type)) + 
  geom_point() +
  scale_x_log10() +
  scale_x_reverse() + 
  scale_y_reverse() 

str(stars)

