df <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-Simon-Cao-Git/main/data/GamingStudy_filtered.csv")

library(dplyr)
library(stringr)
library(tibble)
library(scales)
library(shiny)
library(stringr)
library(ggplot2)
library(shinyWidgets)

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
  labs(title = "sattifection level of gamers in USA") +
  coord_polar("y") +
  geom_col() +
  geom_text(aes(label = labels),
            position = position_stack(vjust = 0.5)) +
  theme_void() 

server <- function(input, output) {
  output$piechart <- renderPlot({
    if(input$radio == "sp"){
      plot <- ggplot(data = sss, aes(x = "", y = n, fill = anxietys))+
        geom_bar(stat = "identity") + 
        labs(title = "social phobia levels of gamers in USA") +
        coord_polar("y") +
        geom_col() +
        geom_text(aes(label = labels),
                  position = position_stack(vjust = 0.5)) +
        theme_void()
    } else if(input$radio == "anxiety") {
      plot <- ggplot(data = totals, aes(x = "", y = n, fill = anxietys))+
        geom_bar(stat = "identity") +
        labs(title = "anxiety levels of gamers in USA") +
        geom_col() +
        coord_polar("y") +
        geom_text(aes(label = labels),
                  position = position_stack(vjust = 0.5)) +
        theme_void()
    } else {
      plot <- ggplot(data = sswl, aes(x = "", y = n, fill = satisfaction))+
        geom_bar(stat = "identity") + 
        labs(title = "satisfaction level of gamers in USA") +
        coord_polar("y") +
        geom_col() +
        geom_text(aes(label = labels),
                  position = position_stack(vjust = 0.5)) +
        theme_void() 
    }
    return(plot)
  })
}

