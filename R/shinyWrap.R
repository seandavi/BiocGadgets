#' Example wrap of shiny app
#' 
#' @import shiny
#' @export
#' @examples 
#' shinyFunction()
shinyWrap = function() {
  require(shiny)
  server <- function(input, output) {
    output$distPlot <- renderPlot({
      hist(rnorm(input$obs), col = 'darkgray', border = 'white')
    })
  }
  
  ui <- fluidPage(
    sidebarLayout(
      sidebarPanel(
        sliderInput("obs", "Number of observations:", min = 10, max = 500, value = 100)
      ),
      mainPanel(plotOutput("distPlot"))
    )
  )
  shinyApp(ui = ui, server = server)
}
