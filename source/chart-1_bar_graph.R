library(tidyverse)
library(dplyr)
library(ggplot2)
library(RColorBrewer)
#library("ggsci")
#install.packages("ggsci")

#Load data
game <- read.csv("../data/GamingStudy_filtered.csv", stringsAsFactors = FALSE)
mydf <- select(game, GAD_T, SWL_T, SPIN_T, Hours, Age)

#Change Age into groups
mydf<- mydf %>% drop_na()
mydf_grouped <- mydf %>% mutate(age = case_when(Age>=18 & Age<=25 ~ "18-25",
                                          Age>=26 & Age<=35 ~ "26-35",
                                          Age>=36 & Age<=44 ~ "36-44"
                                          ))
# Change Hours into groups
mydf_grouped <- mydf_grouped %>%
  mutate(hours = case_when(Hours>=0 & Hours<=20 ~ "0-20",
                                              Hours>=20 & Hours<=40 ~ "20-40",
                                              Hours>=40 & Hours<=60 ~ "40-60",
                                              Hours>=60 & Hours<=80 ~ "60-80",
                                              Hours>=80 & Hours<=100 ~ "80-100"
                                              ))
# Drop NA values in hours group
mydf_grouped <- mydf_grouped %>% drop_na()

unique(game$Playstyle)

# GAD graph
ggplot(data = mydf_grouped, aes(x = hours, y = GAD_T, fill = age)) +
  geom_bar(stat = "summary",
           fun = "mean",
           position = "dodge") +
  labs(title = "Relationship between Anxiety and Hours of Gaming in different age group",
       x = "Average Hours of Gaming Per Week",
       y = "Average GAD Assessment Scores",
       fill = "Age range") + 
  theme(plot.title = element_text(hjust = 0.5, size =14)) +
  scale_fill_brewer(palette = "Paired")
  # scale_fill_jco()
  #scale_fill_manual(values = c("#C3D7A4", "#4E84C4", "#FFDB6D"))

#SWL graph
ggplot(data = mydf_grouped, aes(x = hours, y = SWL_T, fill = age)) +
  geom_bar(stat = "summary",
           fun = "mean",
           position = "dodge") +
  labs(title = "Relationship between Life Satisifaction and Hours of Gaming in different age group",
       x = "Average Hours of Gaming Per Week",
       y = "Average SWL Assessment Scores",
       fill = "Age range")

#SPIN graph
ggplot(data = mydf_grouped, aes(x = hours, y = SPIN_T, fill = age)) +
  geom_bar(stat = "summary",
           fun = "mean",
           position = "dodge") +
  labs(title = "Relationship between Social Phobia and Hours of Gaming in different age group",
       x = "Average Hours of Gaming Per Week",
       y = "Average SPIN Assessment Scores",
       fill = "Age range")

#Plot bar chart of DAG and SWL scores by the hours of gaming per week,
#Grouped by three age groups
longer_data <- mydf_grouped %>%
  pivot_longer(GAD_T:SWL_T, names_to = "criteria", values_to = "scores") %>%
  ggplot(aes(x = hours, y = scores, fill = age)) +
  geom_bar(stat = "summary",
           fun = "mean",
           position = 'dodge') +
  facet_wrap(vars(criteria), ncol = 3) +
  labs(title = "Relationship between Anxiety & Life Satisifaction and
  Hours of Gaming in different age group",
       x = "Average Hours of Gaming Per Week",
       y = "Average Assessment Scores",
       fill = "Age range") +
  scale_y_continuous(breaks = round(seq(min(mydf_grouped$GAD_T),
                                      max(mydf_grouped$SWL_T),
                                      by = 1), 1))
print(longer_data)
