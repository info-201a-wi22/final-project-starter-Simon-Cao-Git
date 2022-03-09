# Tab Panel for Chart 1: Mental Health vs Hours of Gaming

# server practice
library("shiny")
library("plotly")
library("dplyr")

gamingStudy <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-Simon-Cao-Git/main/data/GamingStudy_filtered.csv",
                        stringsAsFactors = FALSE)

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
      plotOutput("scatterplot"),
      br(),
      p("This is the first chart page. Lilah's visualization (and any accompanying
      information) should go here.")
    )
  )
)

ui <- fluidPage(
  tab_panel_chart1
)

#defines server
server <- function(input, output) {
  
  output$scatterplot <- renderPlot({
    # Takes gamingStudy and makes 3 data frames, 1 for each gender option. The data
    # frames are made by grouping by the GAD_T score and averaging the number of 
    # hours played by people with each GAD score.  
    female <- gamingStudy %>%
      select(Hours, matches(input$test), Gender) %>%
      filter(Gender == "Female") %>%
      group_by(across(all_of(input$test))) %>%
      summarize(avg_hours = mean(Hours)) %>%
      mutate(Gender = "Female")
    
    male <- gamingStudy %>%
      select(Hours, matches(input$test), Gender) %>%
      filter(Gender == "Male") %>%
      group_by(across(all_of(input$test))) %>%
      summarize(avg_hours = mean(Hours)) %>%
      mutate(Gender = "Male")
    
    other <- gamingStudy %>%
      select(Hours, matches(input$test), Gender) %>%
      filter(Gender == "Other") %>%
      group_by(across(all_of(input$test))) %>%
      summarize(avg_hours = mean(Hours)) %>%
      mutate(Gender = "Other")
    
    # Full joins the three data frames separated by gender into one data frame
    all_genders <- full_join(female, male) %>%
      full_join(other)
    
    # Plots scatterplot of chosen test vs gaming hours
    scatterplot <- ggplot(all_genders, aes(x = get(input$test), y = avg_hours, color = Gender)) +
      geom_point(na.rm = TRUE) +
      geom_smooth(formula = y ~ x, method = lm, se = FALSE, na.rm = TRUE) +
      labs(title = "Relationship Between Anxiety Levels and Hours of Gaming",
           x = "Assessment Score", y = "Average Hours of Gaming Per Week")
    
    return(scatterplot)
  })
}

shinyApp(ui = ui, server = server)
