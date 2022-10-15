##########################
#Evelyn Martin
#3/29/22
#Data prep 
############################


#load packages
install.packages("MASS")
install.packages("caret")
install.packages("mda")
install.packages("stargazer")
library(tidyverse)
library(MASS)
library(caret)
library(mda)
library(stargazer)
require(DAAG)
library(xlsx)



#load data
abilities<-read.csv(file.choose())
head(abilities)

skills<-read.csv(file.choose())
head(skills)

activities<-read.csv(file.choose())
head(activities)

styles<-read.csv(file.choose())
head(styles)

pm<-read.csv(file.choose())
head(pm)

pm<-pm%>%
  rename("Title" = Occupation)

#read automation
automation<-read.csv(file.choose())
head(automation)


automation<-automation%>%
  dplyr::select(c("Title", "Probability"))  

#abilities filter for relevant abilities 
abilities_mod<-abilities%>%
  filter(Scale.Name == "Importance")%>%
  dplyr::select(c("O.NET.SOC.Code", "Title", "Element.Name", "Data.Value"))

#filter some more variables out
abilities_mod<-abilities_mod%>%
  filter(!Element.Name %in% c('Problem Sensitivity', 'Deductive Reasoning', 'Inductive Reasoning', 'Information Ordering', 'Category Flexibility', 'Mathematical Reasoning', 'Number Facility', 'Memorization', 'Speed of Closure', 'Flexibility of Closure', 'Selective Attention', 'Time Sharing'))


#skills filter for social skills
skills_mod<-skills%>%
  filter(Scale.Name == "Importance")%>%
  group_by(Element.Name)%>%
  filter(Element.Name == "Coordination" | Element.Name == "Social Perceptiveness" | Element.Name == "Instructing" | Element.Name ==  "Negotiation" | Element.Name == "Persuasion" | Element.Name =="Service Orientation")%>%
  ungroup(Element.Name)%>%
  dplyr::select(c("O.NET.SOC.Code", "Title", "Element.Name", "Data.Value"))

#activities filter for "Thinking Creatively"
activities_mod<-activities%>%
  filter(Scale.Name == "Importance") %>%
  filter(Element.Name == "Thinking Creatively")%>%
  dplyr::select(c("O.NET.SOC.Code", "Title", "Element.Name", "Data.Value"))

#styles filter for social and creative properties
styles_mod<-styles%>%
  filter(Scale.Name == "Importance") %>%
  filter(Element.Name == "Concern for Others" | Element.Name == "Innovation" | Element.Name == "Social Orientation")%>%
  dplyr::select(c("O.NET.SOC.Code", "Title", "Element.Name", "Data.Value"))


  
#combine all 4 dfs 
mod_join<-bind_rows(abilities_mod, skills_mod, styles_mod, activities_mod)%>%
  filter(Element.Name %in% c("Social Perceptiveness", "Persuasion", "Negotiation", "Concern for Others", "Manual Dexterity", "Finger Dexterity", "Thinking Creatively", "Originality", "Innovation"))

pivot_mod_join<-mod_join%>%
  pivot_wider(names_from=Element.Name, values_from=Data.Value)


fro<-fro%>%
  dplyr::select(c("Occupation.Name","Training.set.automatable.labels", "Category.Label"))%>%
  rename(Title = "Occupation.Name")

#rename all variables  
final<-final%>%
  left_join(pm, by ="Title")%>%
  rename(or = Originality)%>%
  rename(mandex = `Manual Dexterity`)%>%
  rename(fingdex = `Finger Dexterity`)%>%
  rename(persuasion = Persuasion) %>%
  rename(soc_perc = `Social Perceptiveness`)%>%
  rename(concern = `Concern for Others`) %>%
  rename(thinking_creatively = `Thinking Creatively`)%>%
  rename(awk = Context)%>%
  rename(labels = Training.set.automatable.labels)%>%
  rename(industry = Category.Label)%>%
  rename(negotiation = Negotiation)%>%
  rename(innovation = Innovation)

#create tables with stargazer
stargazer(as.data.frame(final), type="html", title="Table 2. Disaggregated Descriptive Statistics",out="MyTable1.htm")

stargazer(as.data.frame(index_final), type="html", title="Table 3. Aggregated Descriptive Statistics",out="MyTable2.htm")
