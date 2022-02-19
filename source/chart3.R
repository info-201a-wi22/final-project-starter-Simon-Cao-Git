df <- read.csv(file = 'data/GamingStudy_filtered.csv', stringsAsFactors = TRUE)

library(ggplot2)
library(dplyr)
library(stringr)
library(tibble)

minimal_anxiety <- filter(df, GAD_T <= 0 & GAD_T <= 4)
mild_anxiety <- filter(df, GAD_T < 4 & GAD_T <= 9)
moderate_anxiety <- filter(df, GAD_T < 9 & GAD_T <= 14)
severe_anxiety <- filter(df, GAD_T < 14 & GAD_T <= 21)
minimal <- count(minimal_anxiety)
mild <- count(mild_anxiety)
moderate <- count(moderate_anxiety)
severe <- count(severe_anxiety)
dats <- data %>%
  group_by(GAD_T) %>%
  mutate(anxiety = case_when(GAD_T > 14 ~ 'severe',
                             GAD_T > 9 ~ 'moderate',
                             GAD_T > 4 ~ 'mild',
                             TRUE ~ 'minimal'))
total <- rbind(minimal, mild, moderate, severe)
totals <- total %>%
  mutate(anxietys = case_when(n == 4189 ~ 'severe',
                             n == 3575 ~ 'moderate',
                             n == 2116 ~ 'mild',
                             TRUE~ 'minimal'))
ggplot(data = totals, aes(x = "", y = n, fill = anxietys))+
  geom_bar(stat = "identity") + 
  labs(title = "anxiety levels of gamers in USA") +
  coord_polar("y") +
  theme_void()