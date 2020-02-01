install.packages("dplyr")  
install.packages('tidyverse')
install.packages('ggthemes')
install.packages('ggrepel')

library(dslabs)
library(dplyr)
library(ggplot2)
library(ggthemes)
data(gapminder)


head(gapminder)

gapminder %>% 
  filter(year == 2015 & country %in% c("Sri Lanka", "Turkey")) %>% 
  select(country, infant_mortality)
gapminder %>% 
  filter(year == 2015 & country %in% c("Poland", "South Korea")) %>% 
  select(country, infant_mortality)
gapminder %>% 
  filter(year == 2015 & country %in% c("Malaysia", "Russia")) %>% 
  select(country, infant_mortality)
gapminder %>% 
  filter(year == 2015 & country %in% c("Pakistan", "Vietnam")) %>% 
  select(country, infant_mortality)
gapminder %>% 
  filter(year == 2015 & country %in% c("Thailand", "South Africa")) %>% 
  select(country, infant_mortality)


ds_theme_set()
filter(gapminder,  year == 1962) %>%
  ggplot(aes(fertility, life_expectancy)) + 
  geom_point()


#by adding colors assigned on the continent of each point,
#we can easily/better read the plot
ds_theme_set()
filter(gapminder,  year == 1962) %>%
  ggplot(aes(fertility, life_expectancy, color = continent)) + 
  geom_point()


#  with the faceting we can better compare years and
# continents data in a plot, with strates that help us easily 
# compare them
ds_theme_set()
filter(gapminder,  year %in% c(1962, 2012)) %>%
  ggplot(aes(fertility, life_expectancy, color = continent)) + 
  geom_point() + facet_grid(continent~year)


# to face only years in columns to compare different years data 
filter(gapminder,  year %in% c(1962, 2012)) %>%
  ggplot(aes(fertility, life_expectancy, color = continent)) + 
  geom_point() + facet_grid(.~year)

# use facet_wrap to face plots with a better size rendering 
#when they are multiple strates in comparison
years <- c(1962, 1980, 1990, 2000, 2012)
continents <- c("Europe", "Asia")
filter(gapminder,  year %in% years & continent %in% continents) %>%
  ggplot(aes(fertility, life_expectancy, color = continent)) + 
  geom_point() + facet_wrap(.~year)



# time seris plots (USA fertility over the years)

filter(gapminder,  country == "United States") %>%
  ggplot(aes(year, fertility)) + 
  geom_point() 

filter(gapminder,  country == "United States") %>%
  ggplot(aes(year, fertility)) + 
  geom_line() 

# to perform time seris plots comparison before more contries
# we should add group argument in the aesthetic function 


countries <- c("South Korea", "Germany")
filter(gapminder,  country %in% countries)  %>%
  ggplot(aes(year, fertility, group = country)) + 
  geom_line()

# to add color to differentiate country we can replace group by color 
countries <- c("South Korea", "Germany")
filter(gapminder,  country %in% countries)  %>%
  ggplot(aes(year, fertility, col = country)) + 
  geom_line()

#better to add labels instead of legends to the plots. 
# lets plots the life expectancy using the labels instead of the legends
countries <- c("South Korea", "Germany")
labels <- data.frame(country = countries, x = c(1975, 1965) , y = c(60, 72))
gapminder %>% 
  filter(country %in% countries) %>%
  ggplot(aes(year, life_expectancy, col = country)) + 
  geom_line() + 
  geom_text(data = labels, aes(x, y, label = country), size = 5) + 
  theme(legend.position = "none")
  
gapminder <- gapminder %>%
  mutate(dollars_per_day = gdp/population/365)

past_year <- 1970
gapminder %>% 
  filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black")

#with log base 2 transformation (logs values ! not the the original ones)
past_year <- 1970
gapminder %>% 
  filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(log2(dollars_per_day))) +
  geom_histogram(binwidth = 1, color = "black")


#with log base 2 transformation (origanal values in a log scales)
past_year <- 1970
gapminder %>% 
  filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black") + 
  scale_x_continuous(trans = "log2")


#to see the number of region, we can use this command
length(levels(gapminder$region))

#to compare histograms of gdp per citizen per day
#we need to startity the plots 
p <- gapminder %>% 
  filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(region, dollars_per_day)) 
p + geom_boxplot() + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


#to compare histograms of gdp per citizen per day we need to 
#startity the plots, rordering the regions by mean incomes, also
#adding points to see where each country fits in the boxplots
p <- gapminder %>% 
  filter(year == past_year & !is.na(gdp)) %>%
  mutate(region = reorder(region, dollars_per_day, FUN = median)) %>%
  ggplot(aes(region, dollars_per_day, fill = continent))  + 
  geom_boxplot() + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
  xlab("")
p + scale_y_continuous(trans = "log2") + geom_point(show.legend = FALSE)



#Comparing distributions
west <- c("Western Europe", "Northern Europe", "Southern Europe", "Northern America", "Australia and New Zealand")

past_year <- 1970
gapminder %>% 
  filter(year == past_year & !is.na(gdp)) %>%
  mutate(group = ifelse(region%in%west, "West", "Developing")) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black") + 
  scale_x_continuous(trans = "log2") + 
  facet_grid(.~group)


west <- c("Western Europe", "Northern Europe", "Southern Europe", "Northern America", "Australia and New Zealand")
past_year <- 1970
present_year <- 2010
gapminder %>% 
  filter(year %in% c(past_year, present_year)  & !is.na(gdp)) %>%
  mutate(group = ifelse(region %in% west, "West", "Developing")) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black") + 
  scale_x_continuous(trans = "log2") + 
  facet_grid(year~group)


country_list_1 <-  gapminder %>% 
  filter(year == past_year & !is.na(dollars_per_day)) %>% .$country
  
country_list_2 <- gapminder %>% 
  filter(year == present_year & !is.na(dollars_per_day)) %>% .$country

country_list <- intersect(country_list_1, country_list_2)
country_list

gapminder %>% 
  filter(year %in% c(past_year, present_year)  & country %in% country_list ) %>%
  mutate(group = ifelse(region %in% west, "West", "Developing")) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black") + 
  scale_x_continuous(trans = "log2") + 
  facet_grid(year~group)


#to see which country increase the most 

p <- gapminder %>% 
  filter(year %in% c(past_year, present_year)  & country %in% country_list) %>%
  mutate(region = reorder(region, dollars_per_day, FUN = median)) %>%
  ggplot(aes(region, dollars_per_day, fill = continent))  + 
  geom_boxplot() + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
  xlab("") + scale_y_continuous(trans = "log2") + 
  facet_grid(year~.)
p

#to ease the comparison use the following code
p <- gapminder %>% 
  filter(year %in% c(past_year, present_year)  & country %in% country_list) %>%
  mutate(region = reorder(region, dollars_per_day, FUN = median)) %>%
  ggplot()+ theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
  xlab("") + scale_y_continuous(trans = "log2") 
p + geom_boxplot(aes(region, dollars_per_day, fill = factor(year)))


#compares west and developping countriesd using smooth density plots
p <-  gapminder %>% 
  filter(year %in% c(past_year, present_year)  & country %in% country_list ) %>%
  mutate(group = ifelse(region %in% west, "West", "Developing")) %>%
  ggplot(aes(dollars_per_day, y = ..count.., fill = group)) + 
  scale_x_continuous(trans = "log2") 

  p + geom_density(alpha = 0.2, bw = 0.75) +  facet_grid(year~.)

#to plots the density smooth showing differents regions of the world we can do
#something like
 gapminder <-  gapminder %>% 
       mutate(group = case_when(
         .$region %in% west ~ "West", 
         .$region %in% c("Eastern Asia", "South-Eastern Asia") ~ "East Asia", 
         .$region %in% c("Caribbean", "Central America", "South America") ~ "Latin America",
         .$continent == "Africa" & .$region != "Northern Africa" ~ "Sub-Saharan Africa",
         TRUE ~ "Others"))
  
 gapminder <- gapminder %>% 
      mutate(group = factor(group, levels = c("Others", "Latin America", "East Asia", "Sub-Saharan Africa", "West")))
 
 p <-  gapminder %>% 
   filter(year %in% c(past_year, present_year)  & country %in% country_list ) %>%   
   ggplot(aes(dollars_per_day, y = ..count.., fill = group)) + 
   scale_x_continuous(trans = "log2") 
 
 p + geom_density(alpha = 0.2, bw = 0.75, position = "stack") +  facet_grid(year~.)

 
 #if we want to add a weight argument on plots based on the population of each country
 
 gapminder <-  gapminder %>% 
   mutate(group = case_when(
     .$region %in% west ~ "West", 
     .$region %in% c("Eastern Asia", "South-Eastern Asia") ~ "East Asia", 
     .$region %in% c("Caribbean", "Central America", "South America") ~ "Latin America",
     .$continent == "Africa" & .$region != "Northern Africa" ~ "Sub-Saharan Africa",
     TRUE ~ "Others"))
 
 gapminder <- gapminder %>% 
   mutate(group = factor(group, levels = c("Others", "Latin America", "East Asia", "Sub-Saharan Africa", "West")))
 
 p <-  gapminder %>% 
   filter(year %in% c(past_year, present_year)  & country %in% country_list ) %>% 
   group_by(year) %>%
   mutate(weight = population/sum(population)*2) %>% 
   ungroup() %>%
   ggplot(aes(dollars_per_day, fill = group, weight = weight)) + 
   scale_x_continuous(trans = "log2") 
 
 p + geom_density(alpha = 0.2, bw = 0.75, position = "stack") +  facet_grid(year~.)
 
 
 #other studies
 gapminder <-  gapminder %>% 
   mutate(group = case_when(
     .$region %in% west ~ "The West", 
     .$region %in% "Northern Africa" ~ "Northern Africa", 
     .$region %in% c("Eastern Asia", "South-Eastern Asia") ~ "East Asia", 
     .$region == "Southern Asia" ~ "Southern Asia"
     .$region %in% c("Caribbean", "Central America", "South America") ~ "Latin America",
     .$continent == "Africa" & .$region != "Northern Africa" ~ "Sub-Saharan Africa",
     .$region %in% c("Melanesia", "Micronesia", "Polynesia") ~ "Pacific Islands"))
 
 surv_income <- gapminder %>% 
   filter(year %in% present_year & !is.na(gdp) & !is.na(infant_mortality) & !is.na(group)) %>%
   group_by(group) %>%
   summarise(income = sum(gdp)/sum(population)/365, 
             infant_survival_rate = 1 - sum(infant_mortality/1000*population)/sum(population))
 
 surv_income %>% arrange(income)
 