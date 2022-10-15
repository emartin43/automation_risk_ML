##########################
#Evelyn Martin
#3/29/22
#Probit model and marginal fx to determine influence of each trait on probability of automation for any given occupation, on average. 
############################


library(mfx)
install.packages("aod")
require(aod)
install.packages("modelsummary")
library(modelsummary)

#run probit
model1<-glm(class~or + mandex + fingdex + soc_perc + persuasion + negotiation + innovation + concern + thinking_creatively + awk, family = binomial(link = "probit"),data = predictions_QDA)
summary(model1, robust = T, use = "complete.obs")


#find mean for each category for each title
creative_final<-creative%>%
  dplyr::select(Title, Element.Name, Data.Value)%>%
  group_by(Title)%>%
  summarise(creative_score = mean(Data.Value))

social_final<-social%>%
  dplyr::select(Title, Element.Name, Data.Value)%>%
  group_by(Title)%>%
  summarise(social_score = mean(Data.Value))

percep_manip_final<-percep_manip%>%
  dplyr::select(Title, Element.Name, Data.Value, Context)%>%
  group_by(Title)%>%
  mutate(context.mean = Context/20)%>%
  summarise(social_score = mean((Data.Value + context.mean)))

index_final<-social_final%>%
  left_join(percep_manip_final, by = 'Title')%>%
  left_join(creative_final, by = 'Title')%>%
  rename(social_score = social_score.x)%>%
  rename(percep_manip_score = social_score.y)%>%
  left_join(predictions_QDA, by = 'Title')

model2<-glm(class~social_score+creative_score+percep_manip_score, family = binomial(link = "probit"),data = index_final)
summary(model2, robust = T, use = "complete.obs")

#run mfx
probitmfx(class~or + mandex + fingdex + soc_perc + persuasion + negotiation + innovation + concern + thinking_creatively + awk, predictions_QDA)

x<-probitmfx(class~social_score+creative_score+percep_manip_score,data = index_final)

index_final$class <- as.numeric(index_final$class)
y<-lm(class~social_score+creative_score+percep_manip_score, data = index_final)
summary(y)

#log likelihood
logLik(model1)
logLik(model2)

#confidence intervals
confint(model1)
confint(model2)

#stargazer
stargazer(model2,y, type="html", title="Probit Model and Marginal Effects",out="Probit_model.htm")
modelsummary(x)


