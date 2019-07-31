#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Stopping Distance Predictor"),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h2('Choose a speed in mph to predict the stopping distance'),
            sliderInput("sliderSpeed",
                        "Speed in mph",
                        min = 0,
                        max = 35,
                        value = 5)
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("plot1"),
            h3("Predicted Stopping Distance (ft):"),
            textOutput('pred')
        )
    )
))
