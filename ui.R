library(shiny)
library(markdown)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Online Conversion - Temperature Conversion"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    sliderInput("temper", 
                "Temperature:",
                min = -1000,
                max = 1000, 
                value = 0,
                step = 0.5),

    selectInput("tipo",
                "Choose a kind of temperature conversion:",
                list("fahr_to_kelvin" = "f-k", 
                     "kelvin_to_celsius" = "k-c", 
                     "fahr_to_celsius" = "f-c",
                     "celsius_to_fahr" = "c-f"))
    ),

  mainPanel(
    tabsetPanel(id = 'a', selected = '1',
      tabPanel(p(icon("line-chart"), "Result"),value = '1', h3(textOutput('previsto'))),
      
      tabPanel(p(icon("info-circle"), "Documentation"), value = '2', includeMarkdown("README.md")),
      
      tabPanel(p(icon("link"), "Links"), value = '3',
               h2("Links"),
               p(strong(em("Documentation:",a("Online Conversion - Temperature Conversion",href="README.html")))),
               p(strong(em("Github repository:", 
                           a("Developing Data Products - Peer Assessment Project; Shiny App",
                           href="https://github.com/Ebberth/DataProduct")))
               ),
               h2("Interesting Links"),
               p(strong(em("Wikipedia:",a("Kelvin Scale",href="https://en.wikipedia.org/wiki/Kelvin")))),
               p(strong(em("Wikipedia:",a("Celsius Scale",href="https://en.wikipedia.org/wiki/Celsius")))),
               p(strong(em("Wikipedia:",a("Fahrenheit Scale",href="https://en.wikipedia.org/wiki/Fahrenheit")))),
               p(strong(em("Wikipedia:",a("Scale of temperature",href="https://en.wikipedia.org/wiki/Scale_of_temperature")))),
               p(strong(em("Wikipedia:",a("Temperature",href="https://en.wikipedia.org/wiki/Temperature")))),
               p(strong(em("Wikipedia:",a("Conversion of units of temperature",href="https://en.wikipedia.org/wiki/Conversion_of_units_of_temperature")))),
               p(strong(em("Allmeasures:",a("Temperature Conversion Table",href="http://www.allmeasures.com/temperature.html")))),
               p(strong(em("Atmos:",a("From fahrenheit to celsius to kelvin and back",href="http://ww2010.atmos.uiuc.edu/(Gh)/guides/maps/ctof.rxml"))))
      )
    )
  )
))

