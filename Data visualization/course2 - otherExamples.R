library(ggthemes)
library(ggrepel)
library(tidyverse)
library(dslabs)
data("heights")


#How we can create a histogram of male heigths form heights 
#dataset using ggplots
#heights %>% filter(sex == "Male")
#p <- heights %>% filter(sex == "Male") %>% ggplot(aes(x = height))
#p <- p + geom_histogram(binwidth = 1, fill = "blue", col = "black") +   xlab("Male heights in inches") +   ggtitle("Histogram")
#p

#now lets create a density plot of the male heights
#p <- heights %>% filter(sex == "Male") %>% ggplot(aes(x = height))
#p <- p + geom_density(fill = "blue")
#p

#to make a QQ plot
p <- heights %>% filter(sex == "Male") %>% ggplot(aes(sample = height))

params <- heights %>% filter(sex == "Male") %>% summarise(mean = mean(height), sd = sd(height))

p <- p + geom_qq(dparams = params) + geom_abline()
p

