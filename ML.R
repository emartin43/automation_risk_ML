##########################
#Evelyn Martin
#3/29/22
#ml bulk, training set, predictions
############################


#load packages
library(tidyverse)
library(MASS)
library(klaR)
library(xtable)
library(caret)

# Load the data
final<-read.csv(file.choose())

# Split the data into training data
sub_final<-final%>%
  filter(labels == 1 | labels == 0)

set.seed(3456)
trainIndex <- createDataPartition(sub_final$labels, p = 1,
                                  list = FALSE,
                                  times = 1)
train <- sub_final[trainIndex,]


# Fit the model
model <- qda(labels ~ or + mandex + fingdex + soc_perc + persuasion + negotiation + innovation + concern + thinking_creatively+awk, data = train)

model

predict(model, final)

#predictions
predictions_QDA = data.frame(predict(model, final))

predictions_QDA = cbind(final, predictions_QDA)

predictions_QDA %>%
  count(class, labels, na.rm=TRUE)

predictions_QDA %>%
  summarize(score = mean(class == labels, na.rm = TRUE))

train%>%
  summarize(score = mean(class == labels, na.rm = TRUE))

predictions_QDA<-predictions_QDA%>%
  rename("0" = "posterior.0")%>%
  rename("1" = "posterior.1")

par(mfrow=c(1,1))
plot(predictions_QDA$posterior.0, predictions_QDA$class,col=train$labels+10)

# confusion matrix
table(final$labels, predictions_QDA$class)

# accuracy rate
mean(predictions_QDA$class == final$labels, na.rm = TRUE)

# error rate
mean(predictions_QDA$class != final$labels, na.rm = TRUE)
---------

#probabilities table

print(xtable(predictions_QDA_subset_0, type = "latex", tabular.environment="longtable"), file = "probabilities_table.tex")
-------------
  
long_index_final<-index_final%>%
  pivot_longer(cols = social_score.x:creative_score,
               values_to = "value")

x<-long_index_final%>%ggplot(aes(value,)) + geom_point(aes(color = name)) +
  scale_colour_manual(values=c("red", "blue", "black"))


## Plot (probability)
plotQdaProb <- ggplot(data = long_index_final,
                      mapping = aes(x = posterior.1, y = name, color = name)) +
  layer(geom = "point") +
  scale_color_gradient(low = "yellow", high = "red") +
  theme_bw() +
  theme(legend.key = element_blank()) +
  labs(title = "Predicted probability of outcome (QDA)")
grid.arrange(plotData, plotQdaProb, ncol = 2)

table(labels, predictions_QDA$labels)


