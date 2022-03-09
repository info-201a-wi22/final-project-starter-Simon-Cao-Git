source("tabs/tab_panel_intro.r") # We work on this file together
source("tabs/tab_panel_chart1.r") # Lilah completes this file
source("tabs/tab_panel_chart2.r") # Xuanyu completes this file
source("tabs/tab_panel_chart3.r") # Han completes this file
source("tabs/tab_panel_summary.r") # Simon completes this file
source("tabs/tab_panel_report.r") # Elora completes this file

# Define UI for final application
ui <- fluidPage(
  includeCSS("www/style.css"),
  navbarPage(
    title = span("Project SEGA", style = "color: #17569b"),
    
    # Introduction
    tab_panel_intro, # Everyone
    
    # Three Charts
    
    tab_panel_chart3, # Han
    tab_panel_chart2, # Xuanyu
    tab_panel_chart1, # Lilah
    
    # Project summary
    tab_panel_summary, # Simon
    
    # Project Report
    tab_panel_report # Elora
  )
)
