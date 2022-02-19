# aggregate_table

library(dplyr)

unfiltered_data <- read.csv("https://osf.io/ru5kc/download",header = TRUE)

US_data <- unfiltered_data %>%
  filter(Residence == "USA")

agg_table_data <- US_data %>%
  group_by(Platform) %>%
  summarise(TotalPlayerCount = n(), 
            MalePlayerCount = sum(Gender == "Male"), 
            FemalePlayerCount = sum(Gender == "Female"),
            AverageHours = mean(Hours, na.rm = TRUE),
            AverageGADScore = mean(GAD_T),
            AverageSWLScore = mean(SWL_T),
            AverageSPINScore = mean(SPIN_T, na.rm = TRUE)
            )

agg_table <- table(agg_table_data)

