library(shiny)
library(tidyr)
library(dplyr)
library(ggplot2)

shinyServer(function(input, output) {
  
  
  irisData <- reactive({
      irisMorph <- iris
      if(input$inc_setosa == FALSE) {
        irisMorph <- irisMorph[irisMorph$Species != "setosa",]
      }
      if(input$inc_versicolor == FALSE) {
        irisMorph <- irisMorph[irisMorph$Species != "versicolor",]
      }
      if(input$inc_virginica == FALSE) {
        irisMorph <- irisMorph[irisMorph$Species != "virginica",]
      }
      irisMorph
  })
  
  modelData <- reactive({
    irisMorph <- irisData()
    if(nrow(irisMorph) != 0)
    {
      lm(irisMorph[,as.numeric(input$yval)] ~ irisMorph[,as.numeric(input$xval)])
    }
    else
    {
      NULL
    }
  })
  
  output$plot1 <- renderPlot({
    irisMorph <- irisData()
    
    pxlab <- paste(names(iris)[as.numeric(input$xval)])
    pylab <- paste(names(iris)[as.numeric(input$yval)])
    plegend <- paste(names(iris)[5])
    ptitle <- paste(pylab, " vs ", pxlab)
    if(input$inc_lm == TRUE) {
      ptitle <- paste(ptitle, " (Regression Line Included)")
    }
    
    p <- ggplot(irisMorph, aes(x = irisMorph[,as.numeric(input$xval)], y = irisMorph[,as.numeric(input$yval)])) + geom_point(aes(colour = irisMorph[,5]))
    if(input$inc_lm == TRUE) {
      p <- p + geom_smooth(method=lm)
    }
    p <- p  + ggtitle(ptitle) + xlab(pxlab) + ylab(pylab) + scale_color_discrete(name=plegend)
    p
  })
  output$plot2 <- renderPlot({
    irisMorph <- irisData()
    
    p2xlab <- paste(names(iris)[5])
    p2ylab <- paste(names(iris)[as.numeric(input$yval)])
    p2legend <- paste(names(iris)[5])
    p2title <- paste(p2ylab, " by Species Type")
    
    p2 <- ggplot(irisMorph, aes(x = irisMorph[,5], y = irisMorph[,as.numeric(input$yval)]))
    p2 <- p2 + geom_boxplot() + geom_jitter(width = 0.2, aes(colour = irisMorph[,5]))
    p2 <- p2 + ggtitle(p2title) + xlab(p2xlab) + ylab(p2ylab) + scale_color_discrete(name=p2legend)
    p2
  })
  
  output$pval <- renderText({
    irisMorph <- irisData()
    model <- modelData()
    
    if(nrow(irisMorph) != 0)
    {
      pval <- summary(model)$coeff[2,4]
    }
    else
    {
      pval <- "NA"
    }
    
    pval
  })
  output$intercept <- renderText({
    irisMorph <- irisData()
    model <- modelData()
    
    if(nrow(irisMorph) != 0)
    {
      intercept <- summary(model)$coeff[1,1]
    }
    else
    {
      intercept <- "NA"
    }
    
    intercept
  })
  output$slope <- renderText({
    irisMorph <- irisData()
    model <- modelData()
    
    if(nrow(irisMorph) != 0)
    {
      slope <- summary(model)$coeff[2,1]
    }
    else
    {
      slope <- "NA"
    }
    
    slope
  })

})
