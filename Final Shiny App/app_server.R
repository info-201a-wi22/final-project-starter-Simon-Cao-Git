# Define server logic
server <- function(input, output) {
  
  # Chart 1
  
  gamingStudy <- read.csv("../data/GamingStudy_filtered.csv", stringsAsFactors = FALSE)
  output$scatterplot <- renderPlotly({
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
    
    return(ggplotly(scatterplot))
  })
  
  
  # Chart 2
  
  game <- read.csv("../data/GamingStudy_filtered.csv", stringsAsFactors = FALSE)
  mydf <- select(game, GAD_T, SWL_T, SPIN_T, Hours, Age)
  
  #Change Age into groups
  mydf<- mydf %>% drop_na()
  mydf_grouped <- mydf %>% mutate(age = case_when(Age>=18 & Age<=25 ~ "18-25",
                                                  Age>=26 & Age<=35 ~ "26-35",
                                                  Age>=36 & Age<=44 ~ "36-44"
  ))
  # Change Hours into groups
  mydf_grouped <- mydf_grouped %>%
    mutate(hours = case_when(Hours>=0 & Hours<=20 ~ "0-20",
                             Hours>=20 & Hours<=40 ~ "20-40",
                             Hours>=40 & Hours<=60 ~ "40-60",
                             Hours>=60 & Hours<=80 ~ "60-80",
                             Hours>=80 & Hours<=100 ~ "80-100"
    ))
  # Drop NA values in hours group
  mydf_grouped <- mydf_grouped %>% drop_na()
  
  output$age <- renderPlotly({
    age_df <- mydf_grouped %>%
      filter(age %in% input$checkGroup)
    #filter(age == input$checkGroup)
    #filter(mydf$input$checkGroup)
    #line_df <- line_df[line_df$variable %in% input$checkGroup]
    p <- ggplot(data = age_df, aes(x = hours, y = .data[[input$test_visual2]], fill = age
                                   #, fill = variable
                                   #, fill = input$checkGroup
    )) +
      geom_bar(stat = "summary",
               fun = "mean",
               position = "dodge") +
      labs(title = "Relationship between Mental Health and Hours of Gaming in different age group",
           x = "Average Hours of Gaming Per Week",
           y = "Average GAD Assessment Scores",
           fill = "Age range") + 
      theme(plot.title = element_text(hjust = 0.5, size = 16)) +
      scale_fill_brewer(palette = "Paired")
    ggplotly(p)
  })
  
  
  # Chart 3
  df <- read.csv("../data/GamingStudy_filtered.csv", stringsAsFactors = FALSE)
  
  minimal_anxiety <- filter(df, GAD_T >= 0 & GAD_T <= 4)
  mild_anxiety <- filter(df, GAD_T > 4 & GAD_T <= 9)
  moderate_anxiety <- filter(df, GAD_T > 9 & GAD_T <= 14)
  severe_anxiety <- filter(df, GAD_T > 14 & GAD_T <= 21)
  
  minimal_SP <- filter(df, SPIN_T >= 0 & SPIN_T <= 20)
  mild_SP <- filter(df, SPIN_T > 20 & SPIN_T <= 30)
  moderate_SP <- filter(df, SPIN_T > 30 & SPIN_T <= 40)
  severe_SP <- filter(df, SPIN_T > 40 & SPIN_T <= 50)
  vsevere_SP <- filter(df, SPIN_T > 40)
  
  minimal_SW <- filter(df, SWL_T >= 5 & SWL_T <= 9)
  mild_SW <- filter(df, SWL_T > 9 & SWL_T <= 14)
  moderate_SW <- filter(df, SWL_T > 14 & SWL_T <= 19)
  severe_SW <- filter(df, SWL_T > 19 & SWL_T <= 24)
  svere_SW <- filter(df, SWL_T > 14 & SWL_T <= 29)
  vsevere_SW <- filter(df, SWL_T > 29)
  # this creates dataframe for different groups of anxiety
  minimal <- count(minimal_anxiety)
  mild <- count(mild_anxiety)
  moderate <- count(moderate_anxiety)
  severe <- count(severe_anxiety)
  
  minimal_S <- count(minimal_SP)
  mild_S <- count(mild_SP)
  moderate_S <- count(moderate_SP)
  severe_S <- count(severe_SP)
  vsevere_S <- count(vsevere_SP)
  
  minimal_SWW <- count(minimal_SW)
  mild_SWW <- count(mild_SW)
  moderate_SWW <- count(moderate_SW)
  severe_SWW <- count(severe_SW)
  vsvere_SWW <- count(svere_SW)
  vsevere_SWW <- count(vsevere_SW)
  # this code counts number of groups of anxiety
  dats <- df %>%
    group_by(GAD_T) %>%
    mutate(anxiety = case_when(GAD_T > 14 ~ 'severe',
                               GAD_T > 9 ~ 'moderate',
                               GAD_T > 4 ~ 'mild',
                               TRUE ~ 'minimal'))
  
  WL <- df %>%
    group_by(GAD_T) %>%
    mutate(anxiety = case_when(SWL_T > 29 ~ 'Extremely satisfied',
                               SWL_T > 24 ~ 'Satisfied',
                               SWL_T > 19 ~ 'Slightly satisfied',
                               SWL_T > 14 ~ 'Slightly dissatisfied',
                               SWL_T > 9 ~ 'Dissatisfied',
                               TRUE ~ 'Extremely dissatisfied'))
  
  s <- df %>%
    group_by(SPIN_T) %>%
    mutate(anxiety = case_when(SPIN_T > 50 ~ 'very severe',
                               SPIN_T > 40 ~ 'severe',
                               SPIN_T > 30 ~ 'moderate',
                               SPIN_T > 20 ~ 'mild',
                               TRUE ~ 'minimal'))
  
  SWL <- rbind(minimal_SWW, mild_SWW, moderate_SWW, severe_SWW, vsevere_SWW, vsvere_SWW) %>%
    group_by(n) %>% # Variable to be transformed
    count() %>% 
    ungroup() %>% 
    mutate(perc = `n` / sum(`n`)) %>% 
    arrange(perc) %>%
    mutate(labels = scales::percent(perc))
  
  ss <- rbind(minimal_S, mild_S, moderate_S, severe_S, vsevere_S) %>%
    group_by(n) %>% # Variable to be transformed
    count() %>% 
    ungroup() %>% 
    mutate(perc = `n` / sum(`n`)) %>% 
    arrange(perc) %>%
    mutate(labels = scales::percent(perc))
  
  sss <- ss%>%
    mutate(anxietys = case_when(n == 281 ~ 'severe',
                                n == 496 ~ 'moderate',
                                n == 854 ~ 'mild',
                                n == 422 ~ 'very severe',
                                TRUE~ 'minimal'))
  
  sswl <- SWL%>%
    mutate(satisfaction = case_when(n == 397 ~ 'Extremely dissatisfied',
                                    n == 531 ~ 'Extremely satisfied',
                                    n == 754 ~ 'Dissatisfied',
                                    n == 909 ~ 'Slightly dissatisfied',
                                    n == 1020 ~ 'Slightly satisfied',
                                    TRUE~ 'Satisfied'))
  # this codes add the  column summerize the GAD_T level for each and labels them
  total <- rbind(minimal, mild, moderate, severe) %>%
    group_by(n) %>% # Variable to be transformed
    count() %>% 
    ungroup() %>% 
    mutate(perc = `n` / sum(`n`)) %>% 
    arrange(perc) %>%
    mutate(labels = scales::percent(perc))
  
  totals <- total %>%
    mutate(anxietys = case_when(n == 294 ~ 'severe',
                                n == 552 ~ 'moderate',
                                n == 1204 ~ 'mild',
                                TRUE~ 'minimal'))
  # this create a dataset of number of different levels and labels them
  pie_chart <- ggplot(data = totals, aes(x = "", y = n, fill = anxietys))+
    geom_bar(stat = "identity") + 
    labs(title = "anxiety levels of gamers in USA") +
    coord_polar("y") +
    geom_col() +
    geom_text(aes(label = labels),
              position = position_stack(vjust = 0.5)) +
    theme_void()
  
  plot_ly(data=totals,labels=~anxietys, values=~n, type="pie") %>% 
    layout(title = 'United States Music Genre Prevalent in 1999',
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  
  pie_schart <- ggplot(data = sss, aes(x = "", y = n, fill = anxietys))+
    geom_bar(stat = "identity") + 
    labs(title = "social phobia levels of gamers in USA") +
    coord_polar("y") +
    geom_col() +
    geom_text(aes(label = labels),
              position = position_stack(vjust = 0.5)) +
    theme_void()
  
  pie_swlchart <- ggplot(data = sswl, aes(x = "", y = n, fill = satisfaction))+
    geom_bar(stat = "identity") + 
    labs(title = "satifection level of gamers in USA") +
    coord_polar("y") +
    geom_col() +
    geom_text(aes(label = labels),
              position = position_stack(vjust = 0.5)) +
    theme_void() 
  
  output$piechart <- renderPlotly({
    if(input$radio == "sp"){
      plot <- plot_ly(data=sss,labels=~anxietys, values=~n, type="pie") %>% 
        layout(title = 'social phobia levels of gamers in USA',
               xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
               yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
    } else if(input$radio == "anxiety") {
      plot <- plot_ly(data=totals,labels=~anxietys, values=~n, type="pie") %>% 
        layout(title = 'anxiety levels of gamers in USA',
               xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
               yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
    } else {
      plot <- plot_ly(data=sswl,labels=~satisfaction, values=~n, type="pie") %>% 
        layout(title = 'satisfaction level of gamers in USA',
               xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
               yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
    }
    return(plot)
  })
  
}
