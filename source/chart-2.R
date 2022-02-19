# Chart 2
# Anxiety Levels vs. Hours Gaming
library("dplyr")
library("ggplot2")

# Reads in csv filtered for USA residents only into a data frame
gamingStudy <- read.csv("data/GamingStudy_filtered.csv",
                        stringsAsFactors = FALSE)

# Takes gamingStudy and makes 3 data frames, 1 for each gender option. The data
# frames are made by grouping by the GAD_T score and averaging the number of 
# hours played by people with each GAD score.
female <- gamingStudy %>%
  select(Hours, GAD_T, Gender) %>%
  filter(Gender == "Female") %>%
  group_by(GAD_T) %>%
  summarize(avg_hours = mean(Hours)) %>%
  mutate(Gender = "Female")

male <- gamingStudy %>%
  select(Hours, GAD_T, Gender) %>%
  filter(Gender == "Male") %>%
  group_by(GAD_T) %>%
  summarize(avg_hours = mean(Hours)) %>%
  mutate(Gender = "Male")

other <- gamingStudy %>%
  select(Hours, GAD_T, Gender) %>%
  filter(Gender == "Other") %>%
  group_by(GAD_T) %>%
  summarize(avg_hours = mean(Hours)) %>%
  mutate(Gender = "Other")

# Full joins the three data frames separated by gender into one data frame
all_genders <- full_join(female, male) %>%
  full_join(other)

# Plots a scatter plot of the GAD assessment scores by the average hours of
# games played, colored by gender
ggplot(all_genders, aes(x = GAD_T, y = avg_hours, color = Gender)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE) +
  labs(title = "Relationship Between Anxiety Levels and Hours of Gaming",
       x = "GAD Assessment Score", y = "Average Hours of Gaming Per Week")
