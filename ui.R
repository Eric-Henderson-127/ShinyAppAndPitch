library(shiny)

shinyUI(fluidPage(

  titlePanel("Iris Flower Data"),

  sidebarLayout(
    sidebarPanel(
      h5("*See App Info tab for app details and usage help"),
      h3("Variable Selection"),
      radioButtons("yval", "Y value:",
                   c("Sepal.Length" = 1,
                   "Sepal.Width" = 2,
                   "Petal.Length" = 3,
                   "Petal.Width" = 4)),
      radioButtons("xval", "X value:",
                   c("Sepal.Length" = 1,
                     "Sepal.Width" = 2,
                     "Petal.Length" = 3,
                     "Petal.Width" = 4),
                   selected = 2),
      h3("Factor Selection"),
      checkboxInput("inc_setosa", "Include Setosa", value = TRUE),
      checkboxInput("inc_versicolor", "Include Versicolor", value = TRUE),
      checkboxInput("inc_virginica", "Include Virginia", value = TRUE),
      h3("Regression"),
      checkboxInput("inc_lm", "Include Regression Line", value = FALSE),
      h4("Intercept:"),
      textOutput("intercept"),
      h4("Slope:"),
      textOutput("slope"),
      h4("P Value:"),
      textOutput("pval")
    ),

    mainPanel(
      tabsetPanel(
        tabPanel("App",
          plotOutput("plot1"),
          plotOutput("plot2")
        ),
        tabPanel("App Info",
          h3("App Info"),
          p("Created by: Eric Henderson"),
          p("Created on: June 21st 2017"),
          p("Project Source at: https://github.com/Eric-Henderson-127/ShinyAppAndPitch"),
          p("App Presentation at: https://Eric-Henderson-127.github.io/ShinyAppAndPitch/pitch.html"),
          h4("App Purpose"),
          p(paste("This app was developed to demonstrate the Shiny package for the Data Science final project. The app displays ",
                  "information about the Edgar Anderson's Iris Data supplied in the R datasets package. Variables can be selected, ",
                  "along with factors, which are then processed and plot information returned (Scatter plots and box plots) ",
                  "as well as simple regression analysis if selected.")),
          h4("How to use"),
          h5("To Select variables:"),
          p(paste("Click on a radial button corresponding to the variable you are interested in. Y Value will be the y value for ",
                  "the scatter plot and the variable evaluated in the box plot. X value will be the x value for the scatter plot.")),
          h5("To Select Factors:"),
          p(paste("Select any factors you wish to add by checking the check box next to the factor variable. The selected factors ",
                  "will dictate what factors are used in both the scatter plot and box plot.")),
          p("WARNING: If no factors are selected no plots will be displayed until at least one factor is selected"),
          h5("To Toggle Regression Line:"),
          p(paste("To turn on the regression line check the check box next to the regression selection. Similarly, to turn off the regression ",
                  "line simply uncheck the check box next to the regression selection. When selected a regression line will appear ",
                  "in the scatter plot. Whether or not the regression line is selected for display, the regression will be calculated ",
                  "and a slope, intercept, and P Value for the regression will be displayed. Only the variables, ",
                  "and factors, that you have selected will be used to calculate the regression. If no factors are selected then ",
                  "values of NA will be shown for slope, intercept, and P Value until at least one factor is selected."))
        )
      )
    )
  )
))
