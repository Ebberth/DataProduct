library(shiny)

shinyServer(function(input, output, session) {

  fahr_to_kelvin <- function(temp) {
    #Converts Fahrenheit to Kelvin
    kelvin <- paste("Temperature in Kelvin is: ", round(((temp - 32) * (5/9)) + 273.15,1))
    kelvin
  }
  kelvin_to_celsius <- function(temp) {
    #Converts Kelvin to Celsius
    Celsius <- paste("Temperature in Celsius is: ", round(temp - 273.15,1))
    Celsius
  }
  fahr_to_celsius <- function(temp) {
    #Converts Fahrenheit to Celsius
    result <- paste("Temperature in Celsius is: ", round((temp-32)/1.8,1))
    result
  }
  celsius_to_fahr <- function(temp) {
    #Converts Celsius TO Fahrenheit
    fahr <- paste("Temperature in Fahrenheit is: ", round(temp * 1.8 + 32,1))
    fahr
  }
  observeEvent(output$previsto <- renderText(
        if(input$tipo == "f-k") fahr_to_kelvin(input$temper)
        else if(input$tipo == "k-c") kelvin_to_celsius(input$temper)
        else if(input$tipo == "f-c") fahr_to_celsius(input$temper)
        else if(input$tipo == "c-f") celsius_to_fahr(input$temper)
        else "Error"),
        
        updateTabsetPanel(session, inputId = 'a', selected = '1')
  )
    
  # observeEvent(print(input$temper), updateTabsetPanel(session, inputId = 'a', selected = '1'))
  observeEvent(c(input$temper,input$tipo), updateTabsetPanel(session, inputId = 'a', selected = '1'))
  
})

