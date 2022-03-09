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
  "Chart Page",
  sidebarLayout(
    sidebarPanel(
     radio_input
    ),
    mainPanel(plotOutput("piechart"), 
              p("purpose: it to see the distribution of gamers' anxiety level in US."))
  )
)

ui <- fluidPage(
  navbarPage(
    title = "Anxiety and social phobia levels of gamers in USA",
    chart_page
  ))
