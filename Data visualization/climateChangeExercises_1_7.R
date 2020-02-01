update.packages()

library(tidyverse)
library(dslabs)
data(temp_carbon)
data(greenhouse_gases)
data(historic_co2)

str(temp_carbon)


#question 1

temp_carbon %>% 
  filter(!is.na(carbon_emissions)) %>%
  .$year %>% max()


temp_carbon %>%
  filter(!is.na(carbon_emissions)) %>%
  pull(year) %>%
  max()

temp_carbon %>%
  filter(!is.na(carbon_emissions)) %>%
  select(year) %>%
  max()


#question 2

#question 2 - 1
temp_carbon %>%
  filter(!is.na(carbon_emissions)) %>%
  select(year) %>%
  min()

#question 2 - 2 
temp_carbon %>%
  filter(!is.na(carbon_emissions)) %>%
  select(year) %>%
  max()

#question 2 - 3
temp_carbon %>%
  filter(!is.na(carbon_emissions) & year %in% c(1751, 2014)) %>%
  select(carbon_emissions, year)
  

#question 3

#question 3 - 1: What is the first year for which global temperature anomaly (temp_anomaly) data are available? 1880
temp_carbon %>% 
  filter(!is.na(temp_anomaly)) %>%
  .$year %>% min()

#question 3 - 2: What is the last year for which global temperature anomaly data are available? 2018
temp_carbon %>%
  filter(!is.na(temp_anomaly)) %>%
  pull(year) %>%
  max()

#question 3 - 3:How many degrees Celsius has temperature increased over the date range? Compare the temperatures in the most recent year versus the oldest year. 0.93
temp_carbon %>%
  filter(!is.na(temp_anomaly) & year %in% c(1880, 2018)) %>%
  select(temp_anomaly, year)


#question 4

p <- temp_carbon %>% 
  filter(!is.na(temp_anomaly)) %>%
 ggplot(aes(year, temp_anomaly)) + 
  geom_line()

p <- p + geom_hline(aes(yintercept = 0), col = "blue")


p

temp_carbon %>% 
  filter(!is.na(temp_anomaly)) %>%
  .$temp_anomaly %>% mean()


#question 5 

p + ylab("Temperature anomaly (degrees C)") +
  ggtitle("Temperature anomaly relative to 20th century mean, 1880-2018") +
  geom_text(aes(x = 2000, y = 0.05, label = "20th century mean"), col = "blue")

#question 6 
#question 6-1 : When was the earliest year with a temperature above the 20th century mean? 1942
#question 6-2 : When was the last year with an average temperature below the 20th century mean? 1976
#question 6-3 : In what year did the temperature anomaly exceed 0.5 degrees Celsius for the first time ? 1995


#question 7

p + ylab("Temperature anomaly (degrees C)") +
  ggtitle("Temperature anomaly relative to 20th century mean, 1880-2018") +
  geom_text(aes(x = 2000, y = 0.05, label = "20th century mean"), col = "blue") + 
  geom_line(aes(year, ocean_anomaly), col = "red") +   geom_line(aes(year, land_anomaly), col = "green") +   geom_text(aes(x = 2020, y = 1.5, label = "land_anomaly"), col = "green")+ 
  geom_line(aes(year, land_anomaly), col = "green") +  
  geom_text(aes(x = 1960, y = 1.5, label = "land_anomaly"), col = "green") + 
  geom_text(aes(x = 1960, y = 1.35, label = "ocean_anomaly"), col = "red") + 
  geom_text(aes(x = 1960, y = 1.2, label = "general_temp_anomaly"), col = "black")
  
#question 7-1 - land :  has the largest 2018 temperature anomaly relative to the 20th century mean
#question 7-2 - land :  has the largest change in temperature since 1880
#question 7-3 - ocean:  has a temperature anomaly pattern that more closely matches the global pattern



