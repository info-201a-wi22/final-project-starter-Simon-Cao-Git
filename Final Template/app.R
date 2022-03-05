#
# This is the template Professor Hendry provided during lecture on 02/23. 
#   He specifically recommended this template for group collaboration and said
#   it was okay to use this template for the final deliverable.
#

library(shiny)

source("app_ui.R")
source("app_server.R")

# Run the application
shinyApp(ui = ui, server = server)
