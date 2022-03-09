library(shiny)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(tidyr)

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

# Write a server
server <- function(input, output) {
  #Plot graph / AGE
  output$age <- renderPlot({
    age_df <- mydf_grouped %>%
      filter(age %in% input$checkGroup)
      #filter(age == input$checkGroup)
    #filter(mydf$input$checkGroup)
    #line_df <- line_df[line_df$variable %in% input$checkGroup]
    p <- ggplot(data = age_df, aes(x = hours, y = .data[[input$test]], fill = age
                                   #, fill = variable
                                   #, fill = input$checkGroup
                                   )) +
      geom_bar(stat = "summary",
               fun = "mean",
               position = "dodge") +
      labs(title = "Relationship between Mental Health and Hours of Gaming in different age group",
           x = "Average Hours of Gaming Per Week",
           y = "Average GAD Assessment Scores",
           fill = "Age range") + 
      theme(plot.title = element_text(hjust = 0.5, size = 16)) +
      scale_fill_brewer(palette = "Paired")
    p
  })
}  