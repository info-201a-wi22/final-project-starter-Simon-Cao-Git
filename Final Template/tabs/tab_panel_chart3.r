# tab_panel_chart3

library(shiny)
library(dplyr)
library(stringr)
library(ggplot2)
library(shinyWidgets)

radio_input <- radioButtons(inputId = "radio", 
                            label = "Choices",
                            choices = c("Social Phobia" = "sp", "Anxiety" = "anxiety", "Satisfaction" = "satisfaction"), 
                            selected = "sp")

tab_panel_chart3 <- tabPanel(
  "U.S. Distribution",
  "Anxiety and social phobia levels of gamers in USA",
  sidebarLayout(
    sidebarPanel(
      radio_input
    ),
    mainPanel(plotOutput("piechart"), 
              p("These charts can provide general information of distributions of gamers' anxiety level, social phobia level, and satisfaction level of their lives in US. Audiences can choose which graph to view by using the radio bottons. In the chart, we devide the different scores of the survey into several different levels to give a clear understanding of the distribution levels of gamers in US."))
  )
)