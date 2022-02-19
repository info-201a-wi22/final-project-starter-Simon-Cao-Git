
# Summary Information Script 

# Elora Hoberecht


                      ## Questions of Interest: ##

# 1. How does gaming affect mental health? 
                                                                              
# 2. Does age impact the relationship between gaming and mental health?        
                                                                               
# 3. How does gender affect the relationship between gaming and mental health? 
                                                                               
# 4. Is there a relationship between gaming play-style and mental health?       
                                                                               
################################################################################
################################################################################

# Installing necessary packages. 
library("dplyr")
library("stringr")
library("tidyverse")
library("ggplot2")

# Loading the data, filtering by US birthplace & residence, 
# and filtering to include the most relevant columns.

gaming_df <- read.csv("~/INFO-201/Group_Project/P2/GamingStudy_data.csv") %>%
  filter(Residence == "USA") %>% #narrows data set, easier to work with & draw conclusions from
  mutate("GAD_T" = (GAD1 + GAD2 + GAD3 + GAD4 + GAD5 + GAD6 + GAD7)) %>% # Total Anxiety Score
  mutate("SWL_T" = (SWL1 + SWL2 + SWL3 + SWL4 + SWL5)) %>% # Total Life Satisfaction score
  mutate("SPIN_T" = (SPIN1 + SPIN2 + SPIN3 + SPIN4 + SPIN5 + SPIN6 + SPIN7 + SPIN8 + 
                       SPIN9 + SPIN10 + SPIN11 + SPIN12 + SPIN13 + SPIN14 + SPIN15 + SPIN16 + SPIN17)) %>% # Total Social Phobia Score
  summarise(Gender, Age, GAD_T, SWL_T, SPIN_T, Game, streams, Hours, Playstyle)


  
# Compute totals of male, female and 'other' genders.
  num_male <- sum(gaming_df$Gender == "Male")
  
  # Grouped female and "other" responses together because there is so little data 
  # and it was efficient for calculating proportion of men.
  num_other <- sum(gaming_df$Gender != "Male")  
  
  
# A function that takes in the gaming dataset and returns a list summary of information about it:
  summary_info <- list()
  summary_info$prop_men <- round((num_male / num_other)) # 13 : 1 
  summary_info$avg_time <- round(mean(gaming_df$streams + gaming_df$Hours, na.rm = TRUE)) # 31 hours
  summary_info$avg_age <- round(mean(gaming_df$Age, na.rm = TRUE)) # 21 years old
  summary_info$most_popular_game <- gaming_df %>%
      group_by(Game) %>%
      count(Game) %>%
      ungroup(Game) %>%
      filter(n == max(n)) %>%
      pull(Game) #League of Legends
  summary_info$num_multiplayer <- sum(grepl("Multi", gaming_df$Playstyle))
  
  # The following computes avg mental health scores. 
  summary_info$avg_anxiety <- round(mean(gaming_df$GAD_T, na.rm = TRUE)) # Score < 8 = "low anxiety risk"
  summary_info$avg_satisfaction <- round(mean(gaming_df$SWL_T, na.rm = TRUE)) # Score < 20 = "Slightly below average"
  summary_info$avg_phobia <- round(mean(gaming_df$SPIN_T, na.rm = TRUE)) # Score <= 20 = "Low social phobia risk"


  
