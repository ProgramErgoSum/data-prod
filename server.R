library(shiny)
library(ggplot2)
# Define server logic required to draw a histogram and the normal curve
shinyServer(function(input, output) {
  output$bunnyPlot <- renderPlot({
    k <- input$sampleSize
    n <- input$numSamples
    μ <- input$meanWeight
    
    # Random normal bunny weights
    m = NULL
    s = NULL
    for (i in 1:n) {
      w <- rnorm(k,μ)
      v <- var(w)
      
      m <- c(m, mean(w))
      s <- c(s, sqrt(v))
    }
    mDf <- data.frame(means = m, sd = s)
    
    # Plot a histogram of the mean
    # http://stackoverflow.com/a/24745931
    meanNorm <- (mDf$means-μ)/(mDf$sd/sqrt(k))
    b <- reactive({
      df <- data.frame(means=meanNorm)
      df
    })
    
    g <- ggplot(data=b(),
                aes(x=means))
    g <- g + geom_histogram(alpha=0.2,
                            binwidth=0.1,
                            colour="black",
                            aes(y=..density..))
    g <- g + stat_function(fun=dnorm, 
                           colour="blue", 
                           size=1)
    g <- g + ggtitle("Normal distribution of bunny weight")
    g <- g + xlab("x")
    print(g)
    })
})