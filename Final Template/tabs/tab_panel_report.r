# tab_panel_report

# This is the template report page provided by Hendry in lecture on 02/23.
# Notice there is a separate md file called 'report'.

library(shiny)

tab_panel_report <- tabPanel(
  "Report",
  fluidRow(
    column(
      12,
      includeMarkdown("tabs/report.md"),
      p("This is where Simon's work goes.")
    )
  )
)