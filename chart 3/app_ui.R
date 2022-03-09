library(shiny)
library(dplyr)
library(stringr)
library(ggplot2)
library(shinyWidgets)

radio_input <- radioButtons(inputId = "radio", 
                            label = "Choices",
                            choices = c("Social Phobia" = "sp", "Anxiety" = "anxiety", "Satisfaction" = "satisfaction"), 
                            selected = "sp")

chart_page <- tabPanel(
  "General distribution",
  sidebarLayout(
    sidebarPanel(
     radio_input
    ),
    mainPanel(plotlyOutput("piechart"), 
              p("These charts can provide general information of distributions of gamers' anxiety level, social phobia level, and satisfaction level of their lives in US. Audiences can choose which graph to view by using the radio bottons. In the chart, we devide the different scores of the survey into several different levels to give a clear understanding of the distribution levels of gamers in US. In the social phobia level, over half of gamers reported that they have minimal level of social phobia and anxiety level, also, around 44% of gamer reported that they are satisfied with their life. Also, if you hover your mouse on the graph, you can see three lines, first is the level based on the score of the survey, second line is the number of people who got into that score range, third line is the percentage of this section based on the total number. based on these data, it tells us that is US, gamers generally have a well mental health level, we can conclude that gaming have either no impact or have positive impact on mental illness level."))
  )
)

ui <- fluidPage(
  navbarPage(
    title = "Anxiety and social phobia levels of gamers in USA",
    chart_page
  ))
