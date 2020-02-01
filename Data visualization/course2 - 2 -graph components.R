install.packages('tidyverse')
install.packages('ggthemes')
install.packages('ggrepel')

library(ggthemes)
library(ggrepel)
library(tidyverse)


library(dslabs)
data(murders)

# as the muders rate could be explain as y = rx with r equals the average and can be computed as follow
r <- murders %>%  summarise(rate = sum(total)/sum(population)*10^6) %>% .$rate 

#1-create a ggplot object and assign it to p
#p <- ggplot(data = murders)
#or we could use the pipe to do the same murders %>% ggplot()
p <- ggplot(data = murders, aes(population/10^6, total, label = abb))
p
#add layers to to the ggplot object using the '+' symbol
#2-the first layer to add should be the geometry

#3-add labels to each point with geom_label and geom_text functions
#p + geom_point(size = 3) + geom_text(nudge_x = 0.075) + scale_x_continuous(trans = "log10")  + scale_y_continuous(trans = "log10")

p <-  p + scale_x_log10()  + scale_y_log10() + 
  xlab("population in millions (log scale)") + 
  ylab("total number of murders (log scale)") + 
  ggtitle("US Gun murders in US 2010")

p <- p +   geom_abline(intercept = log10(r), lty = 2, color = "darkgrey") + 
  geom_point(aes(col = region), size = 3) + geom_text_repel()

p <- p + scale_color_discrete(name = "Region")

p <- p + theme_economist()

#p <- p + theme_fivethirtyeight()

p



#local changes override global assignments !
#p + geom_point(size = 3) + geom_text(aes(x = 10, y = 800, label = 'hello world'), nudge_x = 1.5)
