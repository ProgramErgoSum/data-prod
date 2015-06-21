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
        tabsetPanel(
          tabPanel("Plot", 
                   plotOutput("bunnyPlot")),
          tabPanel("Documentation", 
                   h3("Central Limit Theorem and weights of bunnies"),
                   h4("Acknowledgement"),
                   p("This example is inspired from this YouTube video."),
                   a("http://www.youtube.com/watch?v=jvoxEYmQHNM", "video"),
                   h4("Introduction"),
                   p("The Central Limit Theorem states that, 
                      the distribution of averages of IID variables becomes 
                      that of a standard normal as the size increases."),
                   h4("Bunny weights"),
                   p("Suppose, we want to measure the average weight of bunnies. We cannot possibly
                     weigh every bunny in the world to calculate the mean. Therefore, we do the following:
                     1. Take a sample (k) number of bunnies to measure their mean weight.
                     2. Take a new sample (k) number of bunnies to measure their mean weight. Repeat this n times.
                     3. When these means are plotted, they will assume the shape of normal distribution curve."),
                   h4("HOWTO"),
                   p("1. Set the value of k using the slider to adjust the sample size.
                      2. Set the value of n using the slider to adjust number of samples.
                      3. Set the value of μ using the slider to adjust the mean weight."),
                   p("The step 3 is used to transform the normal distribution to standard normal 
                     distribution; therefore, for this application, this adjustment is not entirely
                     necessary.")
                   )
          )
      )
    )
  )
)