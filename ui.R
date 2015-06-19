library(shiny)
# Inspired by this very helpful video for Central Limit Theorem
# http://www.youtube.com/watch?v=jvoxEYmQHNM 
shinyUI(fluidPage(
  
    # Application title
    titlePanel("Normal distribution of weight of bunnies"),
    
    # Sidebar with a slider inputs
    sidebarLayout(sidebarPanel(
      
      # Number of bunnies to be drawn per sample
      sliderInput("sampleSize",
                  "Number of bunnies in a sample (k)",
                  min = 20,
                  max = 100,
                  value = 10),
      
      # Number of samples drawn
      sliderInput("numSamples",
                  "Number of samples (n)",
                  min = 100,
                  max = 1000,
                  value = 200),
      
      # Approximate mean of bunny wieght
      sliderInput("meanWeight",
                  "Mean bunny weight (μ)",
                  min = 2,
                  max = 6,
                  value = 3)
    ),
    
    # Show a plot of the generated distribution
      mainPanel(
        plotOutput("bunnyPlot")
      )
    )
  )
)