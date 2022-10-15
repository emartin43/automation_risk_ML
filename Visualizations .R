##########################
#Evelyn Martin
#3/29/22
#Visualizing automation risk by industry with histogram 
############################
#load packages
install.packages("ggthemes")
library(ggthemes)
library(tidyverse)

#filter and set as factor 
predictions_QDA_subset_1<-predictions_QDA%>%
  filter(class == "1")

predictions_QDA$industry<-as.factor(predictions_QDA$industry)

# Histogram on a Categorical variable
g <- ggplot(predictions_QDA, aes(industry))
g + geom_bar(position = "fill",aes(fill=class), width = 0.5, ) + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6), plot.subtitle= element_text(size=100)) + 
  labs(title="Histogram on Industry", 
       subtitle="Breakdown of Occupational Risk of Automation by Industry")+
  scale_y_continuous(name = "Proportion")+
  scale_fill_discrete(name = "Automation Risk")+
  theme_economist()+
  scale_colour_economist()+
  scale_fill_economist()+
  labs(fill = "Automatable")
  scale_x_discrete(name = "Industry")


ggplot(predictions_QDA, aes(x=industry, y=class)) + 
  geom_count(aes(size=..prop..), colour="lightgrey") +
  geom_count(aes(size=..prop.., group=class), colour="cornflowerblue")  +
  scale_size(range = c(0,10), breaks=seq(0,1,by=0.2)) +
  coord_fixed() +
  theme_minimal()

# n <- 500
# class <- rep(c("0", "1"), each = n)
# x <- rnorm(n * 2, mean = rep(c(3, 4), each = n), sd = rep(c(0.25, 1), each = n))
# y <- rnorm(n * 2, mean = rep(c(2.5, 1.5), each = n), sd = rep(c(0.25, 1), each = n))
# 
# ggplot(data.frame(class, y, x), aes(x = x, y = y, colour = class)) + geom_point(size = 1.5) + 
#   geom_density_2d() + geom_segment(x = -1, y = 6.5, xend = 7, yend = -1.5, col = "grey60", 
#                                    lwd = 1.2) + geom_segment(x = 3, y = 2.5, xend = 4, yend = 1.5, col = "black", 
#                                                              lwd = 1.2) + coord_fixed(ratio = 1, xlim = c(0, 6), ylim = c(0, 6)) + ggtitle("Color by true class")
# 
# 
# ggplot(data.frame(class, y, x), aes(x = x, y = y, colour = model$class)) + geom_point(size = 1.5) + 
#   geom_density_2d() + geom_segment(x = -1, y = 6.5, xend = 7, yend = -1.5, col = "grey60", 
#                                    lwd = 1.2) + geom_segment(x = 3, y = 2.5, xend = 4, yend = 1.5, col = "magenta", 
#                                                              lwd = 1.2) + coord_fixed(ratio = 1, xlim = c(0, 6), ylim = c(0, 6)) + ggtitle("Colored by QDA classification")



