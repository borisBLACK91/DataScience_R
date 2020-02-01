library(ggthemes)
library(ggrepel)
library(tidyverse)
library(dslabs)
data("murders")

#Exercise 2. Printing
#Remember that to print an object you can use
#the command print or simply type the object. 
#For example, instead of


#Exercise 4. Layers
#Now we are going to add layers and 
#the corresponding aesthetic mappings.
#For the murders data, we plotted total murders
#versus population sizes in the videos.

#Explore the murders data frame to remind yourself
#of the names for the two variables (total murders
#and population size) we want to plot and select the
#correct answer.
#state and abb
#total_murders and population_size
#total and population (CORRECT ANSWER)
#murders and size


#Exercise 5. geom_point 1
#To create a scatter plot, we add a layer with the
#function geom_point. The aesthetic mappings require
#us to define the x-axis and y-axis variables respectively. 
#So the code looks like this:
  
# murders %>% ggplot(aes(x = , y = )) +
#  geom_point()
#except we have to fill in the blanks to define the two variables x and y.
## Fill in the blanks
#murders %>% ggplot(aes(x = population, y = total)) +
 # geom_point()

library(dplyr)
library(ggplot2)
library(dslabs)
data(murders)
## edit the next line to add the label
#murders %>% ggplot(aes(population, total, label = abb)) + geom_point() + geom_label()

#Exercise 10. geom_point colors 2
#Now let's go ahead and make the labels blue.
#We previously wrote this code to add labels to our plot:

murders %>% ggplot(aes(population, total,label= abb)) +
  geom_label(color ="blue")


#Exercise 11. geom_labels by region
#Now suppose we want to use color to represent the different
#regions. So the states from the West will be one color, 
#states from the Northeast another, and so on. In this case, 
#which of the following is most appropriate:

#We are now going to add color to represent the region.

murders %>% ggplot(aes(population, total, label = abb, color = region)) + geom_label()


#Exercise 13. Log-scale
#Now we are going to change the axes to log scales
#to account for the fact that the population distribution 
#is skewed. Let's start by defining an object p that holds
#the plot we have made up to now:

p <- murders %>% ggplot(aes(population, total, label = abb, color = region)) +
  geom_label() 
p + scale_x_log10() + scale_y_log10()

#Exercise 14. Titles
#In the previous exercises we created a plot using
#the following code:
p <- murders %>% ggplot(aes(population, total, label = abb, color = region)) +
  geom_label()
# add a layer to add title to the next line
p + scale_x_log10() + 
  scale_y_log10() + 
  ggtitle("Gun murder data")


library(dplyr)
library(ggplot2)
library(dslabs)
data(heights)


#Exercise 16. (histograms plots) A second example
#Create a ggplot object called p using the pipe to assign the heights data to a ggplot object.
#Assign height to the x values through the aes function.

p <- heights %>% ggplot(aes(height))
p

#Exercise 17. Histograms 2
#Now we are ready to add a layer to actually make 
#the histogram.
#Add a layer to the object p (created in the previous exercise)
#using the geom_histogram function
#to make the histogram.

p <- heights %>% 
  ggplot(aes(height))
## add a layer to p
p + geom_histogram()


#Exercise 18. Histogram binwidth
#Note that when we run the code from the previous exercise 
#we get...the following warning:
#Use the binwidth argument to change the histogram made in 
#the previous exercise to use bins of size 1 inch.

p <- heights %>% 
  ggplot(aes(height))
## add the geom_histogram layer but with the requested argument
p + geom_histogram(binwidth = 1)


#Exercise 19. Smooth density plot
#Now instead of a histogram we are going to make a smooth
#density plot. In this case, we will not make an object p. 
#Instead we will render the plot using a single line of code. 
#Now instead of geom_histogram we will use geom_density to 
#create a smooth density plot.
#Add the appropriate layer to create a 
#smooth density plot of heights.
## add the correct layer using +

heights %>%   ggplot(aes(height)) + geom_density()

#Exercise 20. Two smooth density plots
#Now we are going to make density plots for males and 
#females separately. We can do this using the group 
#argument within the aes mapping. Because each point will 
#be assigned to a different density depending on a
#variable from the dataset, we need to map within aes.
#Create separate smooth density plots for males and females 
#by defining group by sex. Use the existing aes function 
#inside of the ggplot function.
## add the group argument then a layer with +
heights %>% ggplot(aes(height, group = sex)) + geom_density()


#Exercise 21. Two smooth density plots 2
#We can also assign groups through the color or fill
#argument. For example, if you type color = sex ggplot 
#knows you want a different color for each sex. So two 
#densities must be drawn. You can therefore skip the group = sex
#mapping. Using color has the added benefit that it uses color
#to distinguish the groups.
#Change the density plots from the previous exercise to add color.
## edit the next line to use color instead of group then add a density layer
heights %>% ggplot(aes(height, color = sex)) + geom_density()


#Exercise 22. Two smooth density plots 3
#We can also assign groups using the fill argument. 
#When using the geom_density geometry, color creates a 
#colored line for the smooth density plot while fill
#colors in the area under the curve.
#We can see what this looks like by running the following code:

heights %>% ggplot(aes(height, fill = sex)) + geom_density() 
#However, here the second density is drawn over the other. 
#We can change this by using something called alpha blending.

#Set the alpha parameter to 0.2 in the geom_density function
#to make this change.

heights %>% ggplot(aes(height, fill = sex)) + geom_density(alpha = 0.2) 