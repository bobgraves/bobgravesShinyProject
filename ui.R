## MPG Analysis
## ui.R
## Shiny project 
## 09 Developing Data Products
## Bob Graves, March 2015

library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Miles per Gallon (mpg) Analysis of mtcars Data Set"),
    sidebarPanel(
        h4("This site allows you to see how different terms from the R mtcars data set affect fuel economy (mpg)"),
        checkboxGroupInput("id2", "Select terms and click Go! to see a plot of the linear regression model.",selected = "am ",
                           c("Auto-Manual (am)" = "am ",
                             "Cylinders (cyl)" = "cyl ",
                             "Displacement (disp)" = "disp ",
                             "Weight (wt)" = "wt ",
                             "Rear Axle (drat)" = "drat ",                
                             "Horsepower (hp)" = "hp ")),
        actionButton("goButton", "Go!"),
        br(),
        h4("Background"),
        p("The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption",
          "and aspects of automobile design and performance for 32 automobiles (1973–74 models).",
          "Based on the terms selected, this Shiny application produces a linear model predicting ",
          "the effect of those terms on the miles-per-gallon (mpg)."),
        h4("Application Operation"),
        p("Once the user clicks Go!, the linear model is displayed and the plot of the model ",
          "is shown using the 4-part display of model fit.")
    ),
    mainPanel(
        h3('Linear Regression Model'),
        h4('lm() Function'),
        verbatimTextOutput("oid2"),
        h3("Plot of the Model (Click Go to evaluate)"),
        plotOutput('newHist'),
        h4("Developing Data Products, Bob Graves"),
        a(href="http://github.com/bobgraves/bobgravesShinyProject", "Find this app on GitHub")
    )
))
