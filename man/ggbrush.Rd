% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ggbrushGadget.R
\name{ggbrush}
\alias{ggbrush}
\title{Brush Points on ggplot of Data Frame Columns}
\usage{
ggbrush(dframe, xvar, yvar, viewer = paneViewer())
}
\arguments{
\item{dframe}{A data frame with at least two numeric
columns.}

\item{xvar}{The column name from the data.frame of 
the x variable for plotting.}

\item{yvar}{The column name from the data.frame of
the y variable for plotting.}

\item{viewer}{The \code{viewer} used by runGadget. Can
also be \code{dialogViewer} or \code{browserViewer}.
See \code{\link{viewer}} for more details.}
}
\description{
This function takes a data frame and the names
of two numeric columns, draws a plot, and allows
the user to return the subset of the data.frame
that have been highlighted in the plot.
}
\details{
This function uses the miniUI package to 
    form a small Gadget. After the correct subset 
    of data is chosen, clicking "Done" will return
    the rows from the input data.frame via a call
    to \code{\link{stopApp}}.
}
\examples{
data(mtcars)
ggbrush(mtcars,"disp","hp")


}

