# Summary Information Script 
# By: Elora Hoberecht


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

# The data set that we will be using:
OG_df <- read.csv("~/INFO-201/Group_Project/P2/GamingStudy_data.csv")


# Summary DF that stores the most relevant values: Gender, Age, Mental health scores, Preferred game, hours played each week, and play-style. 
gaming_df <- OG_df %>%
  filter(Residence == "USA", Birthplace == "USA") %>% #narrows data set, easier to work with & draw conclusions from
  mutate("GAD_T" = (GAD1 + GAD2 + GAD3 + GAD4 + GAD5 + GAD6 + GAD7)) %>% # Total Anxiety Score
  mutate("SWL_T" = (SWL1 + SWL2 + SWL3 + SWL4 + SWL5)) %>% # Total Life Satisfaction score
  mutate("SPIN_T" = (SPIN1 + SPIN2 + SPIN3 + SPIN4 + SPIN5 + SPIN6 + SPIN7 + SPIN8 + 
                     SPIN9 + SPIN10 + SPIN11 + SPIN12 + SPIN13 + SPIN14 + SPIN15 + SPIN16 + SPIN17)) %>% # Total Social Phobia Score
  summarise(Gender, Age, GAD_T, SWL_T, SPIN_T, Game, streams, Hours, Playstyle)

  
# Compute totals of male, female, and 'other' genders.
  num_male <- sum(gaming_df$Gender == "Male")
  num_other <- sum(gaming_df$Gender != "Male")

  prop_men <- num_male / num_other # 13 men for every non-male respondent!
  

# Compute avg mental health scores.
  avg_anxiety <- mean(gaming_df$GAD_T, na.rm = TRUE) # Score < 8 = "low anxiety risk"
  avg_satisfaction <- mean(gaming_df$SWL_T, na.rm = TRUE) # Score < 20 = "Slightly below average"
  avg_phobia <- mean(gaming_df$SPIN_T, na.rm = TRUE) # Score <= 20 = "Low social phobia risk"
 
  
# A function that takes in the gaming dataset and returns a list summary of information about it:
  summary_info <- list()
  summary_info$prop_men <- round((num_male / num_other))
  summary_info$avg_time <- round(mean(gaming_df$streams + gaming_df$Hours, na.rm = TRUE))
  summary_info$avg_age <- round(mean(gaming_df$Age, na.rm = TRUE))
  summary_info$most_popular_game <- gaming_df %>%
      group_by(Game) %>%
      count(Game) %>%
      ungroup(Game) %>%
      filter(n == max(n)) %>%
      pull(Game)
  summary_info$num_multiplayer <- sum(grepl("Multi", gaming_df$Playstyle))


  
