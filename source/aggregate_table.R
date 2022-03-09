# aggregate_table

# load required library
library(dplyr)

# Load the filtered US data
US_data <- read.csv("../data/GamingStudy_filtered.csv")

# group by platforms and calculate summary data for aggregate table
agg_table <- US_data %>%
  group_by(Platform) %>%
  summarise(TotalPlayerCount = n(), 
            MalePlayerCount = sum(Gender == "Male"), 
            FemalePlayerCount = sum(Gender == "Female"),
            AverageHours = mean(Hours, na.rm = TRUE),
            AverageGADScore = mean(GAD_T),
            AverageSWLScore = mean(SWL_T),
            AverageSPINScore = mean(SPIN_T, na.rm = TRUE)
            ) %>% 
  mutate(across(is.numeric, round, digits=2)) %>% 
  arrange(desc(TotalPlayerCount))

