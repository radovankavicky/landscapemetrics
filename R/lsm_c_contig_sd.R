#' CONTIG_SD (class level)
#'
#' @description Standard deviation of Contiguity index (Shape metric)
#'
#' @param landscape Raster* Layer, Stack, Brick or a list of rasterLayers.
#' @param directions The number of directions in which patches should be connected: 4 (rook's case) or 8 (queen's case).
#'
#' @details
#' \deqn{CONTIG_{SD} =  sd(CONTIG[patch_{ij}])}
#'
#' where \eqn{CONTIG[patch_{ij}]} is the contiguity of each patch.
#'
#' CONTIG_SD is a 'Shape metric'. It summarises each class as the mean of each patch
#' belonging to class i. CONTIG_SD asses the spatial connectedness (contiguity) of
#' cells in patches. The metric coerces patch values to a value of 1 and the background
#' to NA. A nine cell focal filter matrix:
#'
#' ```
#' filter_matrix <- matrix(c(1, 2, 1,
#'                           2, 1, 2,
#'                           1, 2, 1), 3, 3, byrow = T)
#' ```
#' ... is then used to weight orthogonally contiguous pixels more heavily than
#' diagonally contiguous pixels. Therefore, larger and more connections between
#' patch cells in the rookie case result in larger contiguity index values.
#'
#' \subsection{Units}{None}
#' \subsection{Range}{CONTIG_CV >= 0}
#' \subsection{Behaviour}{CONTIG_SD = 0 if the contiguity index is
#' identical for all patches. Increases, without limit, as the variation of
#' CONTIG increases.}
#'
#' @seealso
#' \code{\link{lsm_p_contig}},
#' \code{\link{lsm_c_contig_mn}},
#' \code{\link{lsm_c_contig_cv}}, \cr
#' \code{\link{lsm_l_contig_mn}},
#' \code{\link{lsm_l_contig_sd}},
#' \code{\link{lsm_l_contig_cv}}
#'
#' @return tibble
#'
#' @examples
#' lsm_c_contig_sd(landscape)
#'
#' @aliases lsm_c_contig_sd
#' @rdname lsm_c_contig_sd
#'
#' @references
#' McGarigal, K., SA Cushman, and E Ene. 2012. FRAGSTATS v4: Spatial Pattern Analysis
#' Program for Categorical and Continuous Maps. Computer software program produced by
#' the authors at the University of Massachusetts, Amherst. Available at the following
#' web site: http://www.umass.edu/landeco/research/fragstats/fragstats.html
#'
#' LaGro, J. 1991. Assessing patch shape in landscape mosaics.
#' Photogrammetric Engineering and Remote Sensing, 57(3), 285-293
#'
#' @export
lsm_c_contig_sd <- function(landscape, directions) UseMethod("lsm_c_contig_sd")

#' @name lsm_c_contig_sd
#' @export
lsm_c_contig_sd.RasterLayer <- function(landscape, directions = 8) {
    purrr::map_dfr(raster::as.list(landscape),
                   lsm_c_contig_sd_calc,
                   directions = directions,
                   .id = "layer") %>%
        dplyr::mutate(layer = as.integer(layer))
}

#' @name lsm_c_contig_sd
#' @export
lsm_c_contig_sd.RasterStack <- function(landscape, directions = 8) {
    purrr::map_dfr(raster::as.list(landscape),
                   lsm_c_contig_sd_calc,
                   directions = directions,
                   .id = "layer") %>%
        dplyr::mutate(layer = as.integer(layer))
}

#' @name lsm_c_contig_sd
#' @export
lsm_c_contig_sd.RasterBrick <- function(landscape, directions = 8) {
    purrr::map_dfr(raster::as.list(landscape),
                   lsm_c_contig_sd_calc,
                   directions = directions,
                   .id = "layer") %>%
        dplyr::mutate(layer = as.integer(layer))
}

#' @name lsm_c_contig_sd
#' @export
lsm_c_contig_sd.list <- function(landscape, directions = 8) {
    purrr::map_dfr(landscape,
                   lsm_c_contig_sd_calc,
                   directions = directions,
                   .id = "layer") %>%
        dplyr::mutate(layer = as.integer(layer))
}

lsm_c_contig_sd_calc <- function(landscape, directions) {

    contig_sd  <- landscape %>%
        lsm_p_contig_calc(directions = directions) %>%
        dplyr::group_by(class)  %>%
        dplyr::summarize(value = stats::sd(value))

    tibble::tibble(
        level = "class",
        class = as.integer(contig_sd$class),
        id = as.integer(NA),
        metric = "contig_sd",
        value = as.double(contig_sd$value)
    )

}
