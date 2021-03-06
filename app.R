#Shiny application

library(shiny)

ui <- fluidPage(
  
  titlePanel("ggeor shiny"),
  
  br(),
  p("This shiny page demonstrates how the package ggeor works with its two functions."),
  p("kindly type your address or latitude/longitude below."),
  
  fluidRow(
    column(6,
           h2("gaddress() function"),
           h3("Input form"),
           textInput("address", "Address", value ="linkoping"),
           actionButton("submit", "Submit")
    ),
    
    column(6,
           h2("glatlng() function"),
           h3("Input form"),
           textInput("latlng", "Latitude, Longitude", value = "37.57, 126.98"),
           actionButton("submit", "Submit")
    )
  ),
  
  fluidRow(
    column(6,
           br(),
           h3("The latitude and longitude: "),
           tableOutput("geocode")       
    ),
    
    column(6,
           br(),
           h3("The address: "),
           textOutput("r_geocode")       
    )
  )
)


server <- function(input, output) {
  library(ggeor)
  output$geocode <- renderTable({
    gaddress(input$address)
  })
  
  output$r_geocode <- renderText({
    glatlng(input$latlng)
  })
}

shinyApp(ui = ui, server = server)