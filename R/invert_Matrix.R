
#' Invert a Matrix
#'
#' This function calculates the inverse of a given square matrix using C++ code.
#' @param M A square numeric matrix.
#' @return A numeric matrix representing the inverse of the input matrix.
#' @export
#' @useDynLib HW3
#' @importFrom Rcpp sourceCpp
#' @examples
#' mat <- matrix(c(1, 2, 3, 4), nrow = 2)
#' invertMatrix(mat)
invertMatrix <- function(M) {
  .Call('_HW3_invertMatrix', PACKAGE = 'HW3', M)
}
