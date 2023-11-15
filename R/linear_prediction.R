#'Linear prediction
#'
#'This function is designed to obtain the prediction of linear regression
#'
#'@param X is a matrix of input features, each row represents an observation
#'@param b is nums of parameters you obtained from linear_regression
#'@param intercept is a bool value indicating if model contains an intercept
#'@return the prediction \eqn{X\beta} for linear regression
#'@examples
#' #Load example dataset
#' data(mtcars)
#'
#' #Use horsepower&weight to predict miles per gallon
#' X <- mtcars[, c("hp", "wt")]  # horsepower and weight
#' y <- mtcars$mpg               # miles per gallon
#'
#' # Run the linear regression
#' b <- Linear_regression(X, y)
#' result <- linear_prediction(X,b,TRUE)
#' print(result)
#'
#'@export

linear_prediction<-function(X,b,intercept=TRUE){
  if (!is.matrix(X)){
    X = data.matrix(X)
  }

  if(intercept&!any(apply(X, 2, FUN = function(x) all(x == 1)))){
    X = cbind(1,X)
  }

  beta = data.matrix(b)
  return(drop(X%*%beta))
}
