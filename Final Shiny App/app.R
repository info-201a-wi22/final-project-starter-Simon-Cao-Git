library(shiny)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(tidyr)
library(shinythemes)
library(stringr)
library(shinyWidgets)
library(tibble)
library(scales)
library(shinyWidgets)
library(shinythemes)
library(plotly)

source("app_ui.R")
source("app_server.R")

# Run the application
shinyApp(ui = ui, server = server)
