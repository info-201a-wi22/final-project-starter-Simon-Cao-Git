# tab_panel_chart1

library(shiny)
library("dplyr")
library("ggplot2")

# Reads in csv filtered for USA residents only into a data frame
gamingStudy <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-Simon-Cao-Git/main/data/GamingStudy_filtered.csv",
                        stringsAsFactors = FALSE)
gamingStudy$GAD_T <- unlist(gamingStudy$GAD_T)
gamingStudy$SWL_T <- unlist(gamingStudy$SWL_T)
gamingStudy$SPIN_T <- unlist(gamingStudy$SPIN_T)

# Drop down bar for type of mental health test
select_test <- selectInput(
  inputId = "test",
  label = "Mental Health Test",
  choices = list("Generalized Anxiety", "Satisfaction With Life", "Social Phobia"),
  selected = "Generalized Anxiety"
)

test <- 51
if (input$test == "Satisfaction With Life") {
  test <- "SWL_T"
} else if (input$test == "Social Phobia"){
  test <- "SPIN_T"
}
# Takes gamingStudy and makes 3 data frames, 1 for each gender option. The data
# frames are made by grouping by the GAD_T score and averaging the number of 
# hours played by people with each GAD score.
female <- gamingStudy %>%
  select(Hours, gamingStudy[test], Gender) %>%
  filter(Gender == "Female") %>%
  group_by(gamingStudy[test]) %>%
  summarize(avg_hours = mean(Hours)) %>%
  mutate(Gender = "Female")

male <- gamingStudy %>%
  select(Hours, gamingStudy[test], Gender) %>%
  filter(Gender == "Male") %>%
  group_by(gamingStudy[test]) %>%
  summarize(avg_hours = mean(Hours)) %>%
  mutate(Gender = "Male")

other <- gamingStudy %>%
  select(Hours, gamingStudy[test], Gender) %>%
  filter(Gender == "Other") %>%
  group_by(gamingStudy[test]) %>%
  summarize(avg_hours = mean(Hours)) %>%
  mutate(Gender = "Other")

# Full joins the three data frames separated by gender into one data frame
all_genders <- full_join(female, male) %>%
  full_join(other)
if (test == 51) {
  all_genders$GAD_T <- unlist(all_genders$GAD_T)
} else if (test == 52) {
  all_genders$SWL_T <- unlist(all_genders$SWL_T)
} else {
  all_genders$SPIN_T <- unlist(all_genders$SPIN_T)
}

# Plots a scatter plot of the GAD assessment scores by the average hours of
# games played, colored by gender
scatterplot <- ggplot(all_genders, aes(x = all_genders[GAD_T], y = avg_hours, color = Gender)) +
  geom_point(na.rm = TRUE) +
  geom_smooth(formula = y ~ x, method = lm, se = FALSE, na.rm = TRUE) +
  labs(title = "Relationship Between Anxiety Levels and Hours of Gaming",
       x = "GAD Assessment Score", y = "Average Hours of Gaming Per Week")

GAD_scatterplot

tab_panel_chart1 <- tabPanel(
  "Mental Health vs Gaming Hours",
  sidebarLayout(
    sidebarPanel(
      select_test,
    )
  )
  mainPanel(
    plotOutput(scatterplot),
    br(),
    p("This is the first chart page. Lilah's visualization (and any accompanying
      information) should go here.")
  )
)

