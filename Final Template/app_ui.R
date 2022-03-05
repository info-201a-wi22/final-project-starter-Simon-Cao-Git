#
# This is the template Professor Hendry provided during lecture on 02/23. 
#   He specifically recommended this template for group collaboration and said
#   it was okay to use this template for the final deliverable.
#

library(shiny)

source("tabs/tab_panel_intro.R") # We work on this file together
source("tabs/tab_panel_chart1.R") # Lilah completes this file
source("tabs/tab_panel_chart2.R") # Xuanyu completes this file
source("tabs/tab_panel_chart3.R") # Han completes this file
source("tabs/tab_panel_summary.R") # Simon completes this file
source("tabs/tab_panel_report.R") # Elora completes this file

# Define UI for final application
ui <- navbarPage(
    title = "Project SEGA",
    position = "fixed-top",
    
    # Creates a simple header.
    header = list(
      tags$style(type = "text/css", "body {padding-top: 70px;}"),
      hr(),
      HTML("... Project Header... "),
      hr()
    ),
    
    # Creates a simple footer.
    footer = list(
      tags$style(type = "text/css", "body {padding-top: 70px;}"),
      hr(),
      HTML("... Project Footer... "),
      hr()
    ),
    
    # Introduction
    tab_panel_intro, # Everyone
    
    # Three Charts
    tab_panel_chart1, # Lilah
    tab_panel_chart2, # Xuanyu
    tab_panel_chart3, # Han
    
    # Project summary
    tab_panel_summary, # Simon
    
    # Project Report
    tab_panel_report # Elora
)
