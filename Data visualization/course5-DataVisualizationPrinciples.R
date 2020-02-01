library(dslabs)
library(dplyr)
library(ggplot2)

data(heights)


heights %>% ggplot(aes(sex, height)) + geom_point()

heights %>% ggplot(aes(sex, height)) +
  geom_jitter(width = 0.1, alpha = 0.2) + 
  geom_boxplot(aes(y = height)) 

heights %>% ggplot(aes(height)) +
  geom_histogram() + 

  facet_grid(sex~.)


library(dslabs)
library(dplyr)
library(ggplot2)
library(RColorBrewer)

data(us_contagious_diseases)
str(us_contagious_diseases)


#lets select only data for Measles, and adding a rate per 1000 in the data frame
#and remove Hawaii and Alaska that were not present before

the_disease <- "Measles"
dat <- us_contagious_diseases %>%
  filter(!state%in%c("Alaska", "Hawaii") & disease == the_disease) %>% 
  mutate(rate = count/population*1000) %>% 
  mutate(state = reorder(state, rate))


dat %>% filter(state == "California") %>%
  ggplot(aes(year, rate)) +
  geom_line() + ylab("Cases per 10000") + 
  geom_vline(xintercept = 1963, col = "blue")



dat %>%
  ggplot(aes(year, state, fill = rate)) +
  geom_tile(color = "grey50") + 
  scale_x_continuous(expand = c(0,0)) + 
  scale_fill_gradientn(colors = brewer.pal(9, "Reds"), trans = "sqrt") + 
  geom_vline(xintercept = 1963, col = "blue") + 
  theme_minimal() + 
  theme(panel.grid = element_blank()) + 
  ggtitle(the_disease) + 
  ylab("") + 
  xlab("")


#to show a plot with high precision on the rate , lets 
#try the code below

#Code: Line plot of measles rate by year and state
# compute US average measles rate by year

avg <- us_contagious_diseases %>%
  filter(disease == the_disease) %>% group_by(year) %>%
  summarise(us_rate = sum(count, na.rm = TRUE)/sum(population, na.rm = TRUE)*10000)

# make line plot of measles rate by year by state

dat %>%
  filter(!is.na(rate)) %>%
  ggplot() +
  geom_line(aes(year, rate, group = state), color = "grey50", 
            show.legend = FALSE, alpha = 0.2, size = 1) +
  geom_line(mapping = aes(year, us_rate), data = avg, size = 1, col = "black") +
  scale_y_continuous(trans = "sqrt", breaks = c(5, 25, 125, 300)) +
  ggtitle("Cases per 10000 by state") +
  xlab("") +
  ylab("") +
  geom_text(data = data.frame(x = 1955, y = 50), mapping = aes(x, y, label = "US average"), color = "black") +
  geom_vline(xintercept = 1963, col = "blue")
