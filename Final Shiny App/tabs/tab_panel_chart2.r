# tab_panel_chart2

page_two_sidepanel <- sidebarPanel(
  selectInput(
    "test_visual2",
    label = "Choose an indicator of mental health",
    choices = list( "Anxiety" = "GAD_T",
                    "Life Satisfaction" = "SWL_T",
                    "Social Phobia" = "SPIN_T"),
    selected = "Anxiety"
  ),
  checkboxGroupInput(
    "checkGroup", label = "Choose an age group",
    choices = list("18-25 years old" = "18-25",
                   "26-35 years old" = "26-35",
                   "36-44 years old" =  "36-44"),
    selected = c("18-25",
                 "26-35",
                 "36-44")
  )
)

page_two_mainpanel <- mainPanel(
  plotlyOutput("age"),
  p(strong("This bar chart can demonstrate the relationship between gamers' anxiety level, life satisfaction, or social phobia level and their gaming hours per week. The audience can interactively choose what they want to examine as an indicator of mental health. When choosing what type of mental health indicator the audience wants to explore, we provided three indicators, and each indicator corresponds to a test, which is a survey that contains several related questions to assess people’s mental health. The assessments are called: Generalized Anxiety Disorder (GAD) assessment, Satisfaction with Life (SWL) Scale scores, and the Social Phobia Inverntory (SPIN) scores.")),
  p(strong("Also, the audience can compare the trend between mental health and hours of gaming among people of different age groups. In this dataset, we divided people into three groups: 18-25 years old, 26-35 years old, and 36-44 years old. As broswering from all the indicators, we may find that people with more hours of gaming may have higher anxiety level (higher assessment scores), lower life satisfaction level (lower assessment scores), and more social phobia (higher assessment score). This trend almost keeps the same in three age groups, except for people between 26-35 years old. Surprisingly, they may be less social phobia if they play 60-80 hours per week on average. "))
)

tab_panel_chart2 <- tabPanel(
  "Age Influence",
  h1("How age influence gamers' Mental Health"),
  sidebarLayout(page_two_sidepanel, page_two_mainpanel))
