#' A Gadget for testing gsub regular expressions.
#'
#' @param pattern The regular expression to match.
#'
#' @param replacement The replacement text to substitute for the 
#'     matching pattern.
#'
#' @param x The character string where matches are sought.  
#'
#' @examples
#' 
#' regexTest(pattern = 'night', replace = "day", x = "We can turn day into night with this Gadget")
#'
#' @import miniUI
#' @import shiny
#' @export
regexTest = function(pattern="night", 
                     x = "We can turn day into night with this Gadget",
                     replace = "day") {
  
  ui = miniPage(
    gadgetTitleBar("Basic gsub tester"),
    miniContentPanel(
      textInput("text","Text:", x),
      textInput('pattern','Pattern to replace:', pattern),
      textInput("replacement","Text to substitute", replace),
      textOutput("out")
    )
  )
  server = function(input, output, session) {
    output$out = renderText( gsub(pattern = input$pattern,
                                  replace = input$replacement, 
                                  x = input$text) )
    observeEvent(input$done, {
      returnValue <- input$pattern
      stopApp(returnValue)
    })
  }
  runGadget(ui, server)
}
