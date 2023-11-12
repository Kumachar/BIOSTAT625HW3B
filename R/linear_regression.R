#'Linear Regression
#'
#'This function is designed to obtain the coefficient \eqn{\beta} from ridge regression
#'\deqn{Y = X\beta + e}
#'and minimize \eqn{||Y-X\beta||^2},
#'where \eqn{\beta} served as a predetermined hyperparamter to shift the diagonals of moment matrix.
#'More information about this method could be found in references.
#'@references
#'Wikipedia contributors. (n.d.). Ridge regression. In Wikipedia. Retrieved [November, 11th, 2023], from https://en.wikipedia.org/wiki/Ridge_regression
#'
#'@param x is a matrix of input features, each row represents an observation
#'@param y is a matrix of output labels, each row represents an observation
#'@param intercept is a bool value indicates whether there is intercept in the model, default value is true
#'
#'@return the matrix of parameters \eqn{\beta} forlinear regression
#'
#'@examples
#'square(3)
#'
#'@export

Linear_regression<-function(X,y,intercept=TRUE, scale=FALSE){
  n = nrow(X)
  p = ncol(X)
  result <- solve(t(X)%*%X)*t(X)*y
  return(solve(t(X)%*%X)*t(X)*y)
}
