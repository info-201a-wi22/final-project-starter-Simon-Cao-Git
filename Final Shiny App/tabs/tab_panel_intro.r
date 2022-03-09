# tab_panel_intro

library(shiny)

tab_panel_intro <- tabPanel(
  "Introduction",
  img(src = "gaming_banner.jpg", width = "100%", align = "center"),
  h3("Introduction"),
  p("Video games have rapidly become a major part of our entertainment culture and are only growing in popularity. People of all ages are rushing home from school or work to start playing their favorite games. Video games provide entertainment for individuals through single player games as well as a social platform for people across the world through multi player games. Due to the sudden growth in video game popularity, we have been unable to really know or study how it affects people in other aspects of their lives. Our project intends to answer this question by analyzing the Gaming Habits and Psychological Well-being dataset created by Marian Sauter and Dejan Draschkow, university researchers in Germany. It contains data from gamers around the world about their gaming habits, mental health, and socioeconomic background. In order to look at how gaming affects mental health we will answer 3 major questions:"),
  tags$li(strong("Is there a relationship between hours played and mental
           health scores?")),
  tags$li(strong("How does age impact gaming habits & mental health?")),
  tags$li(strong("How does gender impact gaming habits & mental health?"))
)