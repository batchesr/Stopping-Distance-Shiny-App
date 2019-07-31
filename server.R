#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(stats)
data(cars)
# Define server logic required 
shinyServer(function(input, output) {
    model<-lm(dist~speed,data=cars)
    modelPred<-reactive({
        speedInput<-input$sliderSpeed
        predict(model,newdata=data.frame(speed=speedInput))
    })
    
    output$plot1<-renderPlot({
        
        speedInput<-input$sliderSpeed
        
        # draw the plot
        plot(cars$speed,
             cars$dist,
             xlab='Speed (mph)',
             ylab='Stopping Distance (ft)',
             bty='n',
             pch=16,
             xlim=c(0,35),
             ylim=c(0,120))
        
        abline(model,col='blue',lwd=2)
        points(speedInput,modelPred(),col='red',pch=16,cex=1.2)
    })
    
    output$pred<-renderText({
        modelPred()
    })
    
})
