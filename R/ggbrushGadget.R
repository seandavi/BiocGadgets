#' Brush Points on ggplot of Data Frame Columns
#' 
#' This function takes a data frame and the names
#' of two numeric columns, draws a plot, and allows
#' the user to return the subset of the data.frame
#' that have been highlighted in the plot.
#' 
#' 
#' @param dframe A data frame with at least two numeric
#'     columns.
#' 
#' @param xvar The column name from the data.frame of 
#'     the x variable for plotting.
#'     
#' @param yvar The column name from the data.frame of
#'     the y variable for plotting.
#'
#' @param viewer The \code{viewer} used by runGadget. Can
#'     also be \code{dialogViewer} or \code{browserViewer}.
#'     See \code{\link{viewer}} for more details.
#'     
#' @details This function uses the miniUI package to 
#'     form a small Gadget. After the correct subset 
#'     of data is chosen, clicking "Done" will return
#'     the rows from the input data.frame via a call
#'     to \code{\link{stopApp}}.
#'     
#' @examples 
#' data(mtcars)
#' ggbrush(mtcars,"disp","hp")
#' 
#'
#' @import shiny
#' @import miniUI
#' @import ggplot2
#' @export
ggbrush <- function(dframe, xvar, yvar, viewer=paneViewer()) {
  
  ui <- miniPage(
    gadgetTitleBar("Drag to select points"),
    miniContentPanel(
      # The brush="brush" argument means we can listen for
      # brush events on the plot using input$brush.
      plotOutput("plot", height = "100%", brush = "brush")
    )
  )
  
  server <- function(input, output, session) {
    
    # Render the plot
    output$plot <- renderPlot({
      # Plot the data with x/y vars indicated by the caller.
      ggplot(dframe, aes_string(xvar, yvar)) + geom_point()
    })
    
    # Handle the Done button being pressed.
    observeEvent(input$done, {
      # Return the brushed points. See ?shiny::brushedPoints.
      stopApp(brushedPoints(dframe, input$brush))
    })
  }

  runGadget(ui, server)
}