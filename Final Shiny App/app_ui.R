source("tabs/tab_panel_intro.R") # We work on this file together
source("tabs/tab_panel_chart1.R") # Lilah completes this file
source("tabs/tab_panel_chart2.R") # Xuanyu completes this file
source("tabs/tab_panel_chart3.R") # Han completes this file
source("tabs/tab_panel_summary.R") # Simon completes this file
source("tabs/tab_panel_report.R") # Elora completes this file

# Define UI for final application
ui <- navbarPage(
    theme = shinytheme("slate"),
    title = span(strong("Project SEGA", style = "color: #CD5C5C; font-size: 30px")),
    position = "fixed-top",

    header = list(
      tags$style(type = "text/css", "body {padding-top: 70px;}")
    ),
   
    
    # Introduction
    tab_panel_intro, 
    
    # Three Charts
    tab_panel_chart3, # Han
    tab_panel_chart2, # Xuanyu
    tab_panel_chart1, # Lilah
    
    # Project summary
    tab_panel_summary, # Simon
    
    # Project Report
    tab_panel_report # Elora
)
