# tab_panel_summary

tab_panel_summary <- tabPanel(
  "Summary",
  img(src = "game_brain.jpg", width = "75%", align = "center"),
  h1("Summary Takeaway"),
  fluidPage(
    p(
      "In this project, we focused on the topic of the relationship between",
      em("video games and mental health issues in the United States. ")
    ),
    p("Circling around our 3 main research questions: "),
    p(strong("Is there a relationship between hours played and mental
           health scores?")),
    p(strong("How does age impact gaming habits & mental health?")),
    p(strong("How does gender impact gaming habits & mental health?")),
    div(
      p("we do find 4 main takeaways."),
      p("We find that data shows most gamer in United States do not have
        mental health issues (shown in U.S. Distribution) as most gamers have
        minimal anxiety issues."),
      p("However, we do find a trend bewteen hours played and various test
        scores. To be specific, people who play more games tend to have lower
        satisfication with life and higher anxiety levels (shown in Mental
        Health vs Gaming Hours)."),
      p("This statement also stays true among different genders as genders
          make no major difference accross mental health (shown in Mental
        Health vs Gaming Hours)."),
      p("Similarly, age make no major difference accross mental health (shown in
        Age Difference). People with the same amount of gaming hours have very
        similar anxiety and life satisfaction assessment scores regardless of
        their age. However, it did reveal that people with higher ages tend to
        have lower satisfaction in life and higher mental health issues even if
        they have the same amount of gaming hours as young people.")
    )
  )
)