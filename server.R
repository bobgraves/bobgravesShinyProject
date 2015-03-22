## MPG Analysis
## server.R
## Shiny project 
## 09 Developing Data Products
## Bob Graves, March 2015

library(shiny)
library(UsingR)

data(mtcars)
mtcars$cyl  <- factor(mtcars$cyl)
mtcars$vs   <- factor(mtcars$vs)
mtcars$gear <- factor(mtcars$gear)
mtcars$carb <- factor(mtcars$carb)
mtcars$am   <- factor(mtcars$am,labels=c("Automatic","Manual"))

shinyServer(
    function(input, output) {
        f<-"mpg ~ am"
        fit<-lm(mpg~am,data=mtcars)
        output$oid1 <- renderPrint({input$id1})
        
        output$oid2 <- renderPrint({
            if (input$goButton == 0) {

            }
            else {
                a<-isolate({input$id2})
                #    a<-{input$id2}
                if(length(a)>0) {
                    terms<-paste(a,collapse='+')
                    f<<-paste("mpg ~ ",terms)
                }
            }
            l<-paste("lm (",f,", data=mtcars)")
            fit<<-lm(formula = as.formula(f), data=mtcars)
            
            l
        })
        
        output$newHist <- renderPlot({
            if (input$goButton == 0)
                return()
            
            par(mfrow=c(2,2))
            plot(fit)
        })
        
    }
)
