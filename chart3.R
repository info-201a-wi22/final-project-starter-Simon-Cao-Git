df <- read.csv(file = 'data/GamingStudy_filtered.csv', stringsAsFactors = TRUE)

library(ggplot2)
library(dplyr)
library(stringr)
library(tibble)
library(scales)

minimal_anxiety <- filter(df, GAD_T >= 0 & GAD_T <= 4)
mild_anxiety <- filter(df, GAD_T > 4 & GAD_T <= 9)
moderate_anxiety <- filter(df, GAD_T > 9 & GAD_T <= 14)
severe_anxiety <- filter(df, GAD_T > 14 & GAD_T <= 21)
# this creates dataframe for different groups of anxiety
minimal <- count(minimal_anxiety)
mild <- count(mild_anxiety)
moderate <- count(moderate_anxiety)
severe <- count(severe_anxiety)
# this code counts number of groups of anxiety
dats <- df %>%
  group_by(GAD_T) %>%
  mutate(anxiety = case_when(GAD_T > 14 ~ 'severe',
                             GAD_T > 9 ~ 'moderate',
                             GAD_T > 4 ~ 'mild',
                             TRUE ~ 'minimal'))
# this codes add the  column summerize the GAD_T level for each and labels them
total <- rbind(minimal, mild, moderate, severe)
totals <- total %>%
  mutate(anxietys = case_when(n == 294 ~ 'severe',
                             n == 552 ~ 'moderate',
                             n == 1204 ~ 'mild',
                             TRUE~ 'minimal'))
# this create a dataset of number of different levels and labels them
ggplot(data = totals, aes(x = "", y = n, fill = anxietys))+
  geom_bar(stat = "identity") + 
  labs(title = "anxiety levels of gamers in USA") +
  coord_polar("y") +
  theme_void()
# this create a pie chart

