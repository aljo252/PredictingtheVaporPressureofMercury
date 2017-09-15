library(shiny)
library(datasets)

pressure1 <- read.csv("./data/pressure.csv")

shinyServer(function(input, output){
  model <- lm(pressure ~ temperature, data=pressure1)
  modelpred <- reactive({
    tempinput <- input$slidertemperature
    predict(model, newdata=data.frame(temperature = tempinput))
  })
  output$plot <- renderPlot({
    tempinput <- input$slidertemperature
    
    plot(pressure1$temperature, pressure1$pressure, xlab= "Temperature [deg c]", ylab= "Pressure [mm]", pch=14,
    xlim = c(0,400), ylim = c(0, 900))
    if(input$showModel){
      abline(model, col="blue", lwd=3)
    }
      points(tempinput, modelpred(), col="blue", pch=16, cex=2)
    })
  output$pred <- renderText ({
    modelpred()
  })
})

