% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calculate_metrics.R
\name{calculate_metrics}
\alias{calculate_metrics}
\alias{calculate_metrics}
\alias{calculate_metrics.RasterLayer}
\alias{calculate_metrics}
\alias{calculate_metrics.RasterStack}
\alias{calculate_metrics}
\alias{calculate_metrics.RasterBrick}
\alias{calculate_metrics}
\alias{calculate_metrics.list}
\title{calculate_metrics}
\usage{
calculate_metrics(landscape, what, directions, count_boundary, classes_max,
  neighbourhood, ordered, base, full_name, verbose)

\method{calculate_metrics}{RasterLayer}(landscape, what = "all",
  directions = 8, count_boundary = FALSE, classes_max = NULL,
  neighbourhood = 4, ordered = TRUE, base = "log2", full_name = FALSE,
  verbose = TRUE)

\method{calculate_metrics}{RasterStack}(landscape, what = "all",
  directions = 8, count_boundary = FALSE, classes_max = NULL,
  neighbourhood = 4, ordered = TRUE, base = "log2", full_name = FALSE,
  verbose = TRUE)

\method{calculate_metrics}{RasterBrick}(landscape, what = "all",
  directions = 8, count_boundary = FALSE, classes_max = NULL,
  neighbourhood = 4, ordered = TRUE, base = "log2", full_name = FALSE,
  verbose = TRUE)

\method{calculate_metrics}{list}(landscape, what = "all", directions = 8,
  count_boundary = FALSE, classes_max = NULL, neighbourhood = 4,
  ordered = TRUE, base = "log2", full_name = FALSE, verbose = TRUE)
}
\arguments{
\item{landscape}{Raster* Layer, Stack, Brick or a list of rasterLayers.}

\item{what}{Selected level of metrics: either "all", "patch", "class",
"landscape". The default is "all". It is also possible to specify functions
as a vector of strings, e.g. \code{what = c("lsm_c_ca", "lsm_l_ta")}.}

\item{directions}{The number of directions in which patches should be
connected: 4 (rook's case) or 8 (queen's case).}

\item{count_boundary}{Include landscape boundary in edge length}

\item{classes_max}{Potential maximum number of present classes}

\item{neighbourhood}{The number of directions in which cell adjacencies are considered as neighbours:
4 (rook's case) or 8 (queen's case). The default is 4.}

\item{ordered}{The type of pairs considered. Either ordered (TRUE) or unordered (FALSE).
The default is TRUE.}

\item{base}{The unit in which entropy is measured. The default is "log2",
which compute entropy in "bits". "log" and "log10" can be also used.}

\item{full_name}{Should the full names of all functions be included in the
tibble.}

\item{verbose}{Print warning message if not sufficient patches are present}
}
\value{
tibble
}
\description{
Calculate a selected group of metrics
}
\examples{
\dontrun{
calculate_metrics(landscape)
calculate_metrics(landscape, what = "patch")
}

}
\references{
McGarigal, K., SA Cushman, and E Ene. 2012. FRAGSTATS v4: Spatial Pattern Analysis
Program for Categorical and Continuous Maps. Computer software program produced by
the authors at the University of Massachusetts, Amherst. Available at the following
web site: http://www.umass.edu/landeco/research/fragstats/fragstats.html
}
