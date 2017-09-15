library(shiny)

shinyUI(fluidPage(
  titlePanel("Predict the Vapour Pressure of Mercury by Temperature"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("slidertemperature", "What is the temperature?", 0,400, value=100),
    checkboxInput("showModel", "Show or Hide Model", value=TRUE)
  ),
  mainPanel(
    plotOutput("plot"),
    h2("Predicted Pressure from Temperature"),
    textOutput("pred")
  )
  )
))