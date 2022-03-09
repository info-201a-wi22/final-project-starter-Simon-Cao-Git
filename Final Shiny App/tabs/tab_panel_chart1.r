# Tab Panel for Chart 1: Mental Health vs Hours of Gaming

# defines ui
select_test <- selectInput(
  inputId = "test",
  label = "Mental Health Test",
  choices = list("Generalized Anxiety" = "GAD_T", "Satisfaction With Life" = "SWL_T",
                 "Social Phobia" = "SPIN_T"),
  selected = "Generalized Anxiety"
)

tab_panel_chart1 <- tabPanel(
  "Mental Health vs Gaming Hours",
  sidebarLayout(
    sidebarPanel(
      select_test,
    ),
    mainPanel(
      plotlyOutput("scatterplot"),
      br(),
      p("This scatter plot was intended to demonstrate the relationship between
        mental health and hours of games played per week, with respect to gender.
        The plot can display the Generalized Anxiety Disorder (GAD) Assessment scores,
        the Satisfaction with Life (SWL) Scale scores, or the Social Phobia Inventory (SPIN)
        scores versus the average hours of games played in a week by everyone with that
        score. “Female”, “male”, and “other” were averaged andgraphed separately.
        “Female” data points are colored red, “male” data points are colored green
        and “other” data points are colored blue, as shown in the key. The relationship
        shown by all 3 graphs is that higher hours of gaming is correlated with worse
        mental health. Both the GAD and SPIN graphs had positive slopes and the
        SWL graph had a negative slope for every gender. Higher GAD and SPIN scores
        indicate more severe anxiety and social phobia. Lower SWL scores mean less
        satisfaction with life. People with higher GAD and SPIN scores consistently
        averaged more hours of gaming per week than people with lower scores and
        vice versa for the SWL graph. For all graphs females had lower hours of
        gaming than males. People classified as other had varying trends between
        graphs.")
    )
  )
)
