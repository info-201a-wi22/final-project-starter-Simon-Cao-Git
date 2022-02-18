# Chart 2
# Anxiety Levels vs. Hours Gaming
library("dplyr")
library("ggplot2")

# Reads in csv filtered for USA residents only into a data frame
gamingStudy <- read.csv("data/GamingStudy_filtered.csv",
                        stringsAsFactors = FALSE)

# Takes gamingStudy and makes a data frame by grouping by the GAD_T score and
# averaging the number of hours played by people with each GAD score.
averaged <- gamingStudy %>%
  select(Hours, GAD_T) %>%
  group_by(GAD_T) %>%
  summarize(avg_hours = mean(Hours))

# Plots a scatter plot of the GAD assessment scores by the average hours of
# games played
ggplot(averaged, aes(x = GAD_T, y = avg_hours)) +
  geom_point() +
  geom_smooth(method=lm) +
  labs(title = "Relationship Between Anxiety Levels and Hours of Gaming",
       x = "GAD Assessment Score", y = "Average Hours of Gaming Per Week")

