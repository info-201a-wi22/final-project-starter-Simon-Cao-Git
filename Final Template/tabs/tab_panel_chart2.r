# tab_panel_chart2
library(shiny)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(tidyr)
library(shinythemes)


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


page_two_sidepanel <- sidebarPanel(
  selectInput(
    "test",
    label = "Choose an indicator of mental health",
    choices = list( "Anxiety" = "GAD_T",
                    "Life Satisfaction" = "SWL_T",
                    "Social Phobia" = "SPIN_T"),
    selected = "Anxiety"
  ),
  checkboxGroupInput(
    "checkGroup", label = "Choose an age group",
    choices = list("18-25 years old" = "18-25",
                   "26-35 years old" = "26-35",
                   "36-44 years old" =  "36-44"),
    selected = c("18-25",
                 "26-35",
                 "36-44")
  )
)

page_two_mainpanel <- mainPanel(
  plotOutput("age"),
  p("This bar chart can demonstrate the relationship between gamers’ 
    anxiety level, life satisfaction, or social phobia level and their 
    gaming hours per week. The audience can interactively choose what 
    they want to examine as an indicator of mental health. Also, they 
    can compare the trend among people of different age groups. In 
    this dataset, we divided people into three groups: 18-25 years old, 
    26-35 years old, and 36-44 years old.")
)

tab_panel_chart2 <- tabPanel(
  "Age influence",
  h1("How age influence gamers' Mental Health"),
  sidebarLayout(page_two_sidepanel, page_two_mainpanel))
