data(heights)

s <- heights %>% 
  filter(sex == "Male") %>% 
  summarise(average = mean(height), standard_deviation = sd(height))

class(s)
str(s)

s$average

heights %>% 
  filter(sex == "Male") %>% 
  summarise(median = median(height), minimum = min(height), maximum = max(height))


library(dslabs)
data(murders)

us_murder_rate <- murders %>%
  summarise(rate = sum(total)/sum(population)*100000)
class(us_murder_rate)
us_murder_rate %>% .$rate

us_murder_rate <- murders %>%
  summarise(rate = sum(total)/sum(population)*100000) %>%
  .$rate

class(us_murder_rate)


data(heights)

heights %>% 
  group_by(sex) %>%
  summarise(average = mean(height), standard_deviation = sd(height))


murders %>% arrange(population) 