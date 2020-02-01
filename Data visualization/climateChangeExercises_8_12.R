library(tidyverse)
library(dslabs)
data(temp_carbon)
data(greenhouse_gases)
data(historic_co2)

#question 8

greenhouse_gases %>%
  ggplot(aes(year, concentration, col = gas)) +
  geom_line() +
  facet_grid(gas~., scales = "free") +
  geom_vline(aes(xintercept = 1850)) +
  ylab("Concentration (ch4/n2o ppb, co2 ppm)") +
  ggtitle("Atmospheric greenhouse gas concentration by year, 0-2000")



#question 9

#question 9-1:Which gas was stable at approximately 275 ppm/ppb until around 1850? - co2
#question 9-2:Which gas more than doubled in concentration since 1850? ch4
#question 9-3:Which gas decreased in concentration since 1850? none
#question 9-4:Which gas had the smallest magnitude change since 1850? n2o
#question 9-5:Which gas increased exponentially in concentration after 1850? all


#question 10

temp_carbon %>%
  filter(!is.na(carbon_emissions)) %>%
  ggplot(aes(year, carbon_emissions)) +
  geom_line() 

#Carbon emissions were essentially zero before 1850 and have increased exponentially since then.
#Carbon emissions in 2014 were about 4 times as large as 1960 emissions.
#Carbon emissions have doubled since the late 1970s.
#Carbon emissions change with the same trend as atmospheric greenhouse gas levels (co2, ch4, n2o)


#question 11

co2_time <- historic_co2 %>%
  filter(!is.na(co2)) %>%
  ggplot(aes(year, co2, col = source)) + 
  geom_line()

co2_time

#Modern co2 levels are higher than at any point in the last 800,000 years.
#There are natural cycles of co2 increase and decrease lasting 50,000-100,000 years per cycle.
#In most cases, it appears to take longer for co2 levels to decrease than to increase.



#question 12

co2_time <- historic_co2 %>%
  filter(!is.na(co2)) %>%
  ggplot(aes(year, co2, col = source)) + 
  geom_line() + 
  xlim(-800000, -775000)
co2_time
#Change the x-axis limits to -800,000 and -775,000. About how many years did it take for co2
#to rise from 200 ppmv to its peak near 275 ppmv? -> 10000 years

co2_time <- historic_co2 %>%
  filter(!is.na(co2)) %>%
  ggplot(aes(year, co2, col = source)) + 
  geom_line() + 
  xlim(-375000, -330000)
co2_time
#Change the x-axis limits to -375,000 and -330,000. About how many years did it
#take for co2 to rise from the minimum of 180 ppm to its peak of 300 ppmv? -> 25000 years

co2_time <- historic_co2 %>%
  filter(!is.na(co2)) %>%
  ggplot(aes(year, co2, col = source)) + 
  geom_line() + 
  xlim(-140000, -120000)
co2_time
#Change the x-axis limits to -140,000 and -120,000.
#About how many years did it take for co2 to rise from 200 ppmv to
#its peak near 280 ppmv?  -> 9000 years
  


co2_time <- historic_co2 %>%
  filter(!is.na(co2)) %>%
  ggplot(aes(year, co2, col = source)) + 
  geom_line() + 
  xlim(-3000, 2018)
co2_time
#Change the x-axis limits to -3000 and 2018 to investigate modern changes 
#in co2. About how many years did it take for co2 to rise from its stable level
#around 275 ppmv to the current level of over 400 ppmv? -> 250 years
