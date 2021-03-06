% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lsm_p_shape.R
\name{lsm_p_shape}
\alias{lsm_p_shape}
\alias{lsm_p_shape}
\alias{lsm_p_shape.RasterLayer}
\alias{lsm_p_shape}
\alias{lsm_p_shape.RasterStack}
\alias{lsm_p_shape}
\alias{lsm_p_shape.RasterBrick}
\alias{lsm_p_shape}
\alias{lsm_p_shape.list}
\title{SHAPE (patch level)}
\usage{
lsm_p_shape(landscape, directions)

\method{lsm_p_shape}{RasterLayer}(landscape, directions = 8)

\method{lsm_p_shape}{RasterStack}(landscape, directions = 8)

\method{lsm_p_shape}{RasterBrick}(landscape, directions = 8)

\method{lsm_p_shape}{list}(landscape, directions = 8)
}
\arguments{
\item{landscape}{Raster* Layer, Stack, Brick or a list of rasterLayers.}

\item{directions}{The number of directions in which patches should be
connected: 4 (rook's case) or 8 (queen's case).}
}
\value{
tibble
}
\description{
Shape index (Shape metric)
}
\details{
\deqn{SHAPE = \frac{p_{ij}} {\min p_{ij}}}
where \eqn{p_{ij}} is the perimeter in terms of cell surfaces and \eqn{\min p_{ij}}
is the minimum perimeter of the patch in terms of cell surfaces.

SHAPE is a 'Shape metric'. It describes the ratio between the actual perimeter of
the patch and the hypothetical minimum perimeter of the patch. The minimum perimeter
equals the perimeter if the patch would be maximally compact.

\subsection{Units}{None}
\subsection{Range}{SHAPE >= 1}
\subsection{Behaviour}{Equals SHAPE = 1 for a squared patch and
increases, without limit, as the patch shape becomes more complex.}
}
\examples{
lsm_p_shape(landscape)

}
\references{
McGarigal, K., SA Cushman, and E Ene. 2012. FRAGSTATS v4: Spatial Pattern Analysis
Program for Categorical and Continuous Maps. Computer software program produced by
the authors at the University of Massachusetts, Amherst. Available at the following
web site: http://www.umass.edu/landeco/research/fragstats/fragstats.html

Patton, D. R. 1975. A diversity index for quantifying habitat "edge".
Wildl. Soc.Bull. 3:171-173.
}
\seealso{
\code{\link{lsm_p_perim}},
\code{\link{lsm_p_area}}, \cr
\code{\link{lsm_c_shape_mn}},
\code{\link{lsm_c_shape_sd}},
\code{\link{lsm_c_shape_cv}}, \cr
\code{\link{lsm_l_shape_mn}},
\code{\link{lsm_l_shape_sd}},
\code{\link{lsm_l_shape_cv}}
}
