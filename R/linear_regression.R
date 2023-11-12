#'Linear Regression
#'
#'This function is designed to obtain the coefficient \eqn{\beta} from ridge regression
#'\deqn{Y = X\beta + e}
#'and minimize \eqn{||Y-X\beta||^2},
#'where \eqn{\beta} served as a desired parameter of model.
#'More information about this method could be found in references.
#'@references
#'Wikipedia contributors. (n.d.). Ridge regression. In Wikipedia. Retrieved [November, 11th, 2023], from https://en.wikipedia.org/wiki/Ridge_regression
#'
#'@param x is a matrix of input features, each row represents an observation
#'@param y is a matrix of output labels, each row represents an observation
#'@param intercept is a bool value indicates whether there is intercept in the model, default value is true
#'@param scale is a bool value indicates whether scale the input X in the model, default value is false
#'
#'@return the matrix of parameters \eqn{\beta} forlinear regression
#'
#'@examples
#'Linear_regression(X,y)
#'@export

Linear_regression<-function(X,y,intercept=TRUE, scale=FALSE){
  if(!is.matrix(X)){
    X = as.matrix(X)
  }
  if(!is.matrix(y)){
    y = as.matrix(y)
  }
  if(intercept){
    X = cbind("(Intercept)"=1,X)
  }
  n = nrow(X)
  p = ncol(X)
  result <- solve(t(X)%*%X)%*%t(X)%*%y
  return(drop(result))
}
