library(shiny)
library(stringr)
library(shinyWidgets)
library("dplyr")
library("ggplot2")
library("plotly")

source("app_ui.R")
source("app_server.R")

shinyApp(ui = ui, server = server)