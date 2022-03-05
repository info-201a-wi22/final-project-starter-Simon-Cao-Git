# tab_panel_intro

library(shiny)

tab_panel_intro <- tabPanel(
  "Introduction",
  img(src = "gaming_banner.jpg", width = "100%", align = "center"),
  p("This is the introduction. Information that belongs in the introduction 
    file goes here.")
)