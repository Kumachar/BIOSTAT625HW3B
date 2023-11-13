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
#'@param X is a matrix of input features, each row represents an observation
#'@param y is a matrix of output labels, each row represents an observation
#'@param intercept is a bool value indicates whether there is intercept in the model, default value is true
#'
#'@return the matrix of parameters \eqn{\beta} for linear regression
#'
#'@examples
#' # Load example dataset
#' data(mtcars)
#'
#' #Use horsepower&weight to predict miles per gallon
#' X <- mtcars[, c("hp", "wt")]  # horsepower and weight
#' y <- mtcars$mpg               # miles per gallon
#'
#' # Run the linear regression
#' result <- Linear_regression(X, y)
#'
#'
#' print(result)
#'
#'@export

Linear_regression<-function(X,y,intercept=TRUE){

  if(!is.matrix(X)){
    X = as.matrix(X)
  }
  if(!is.matrix(y)){
    y = as.matrix(y)
  }

  if(intercept&!any(apply(X, 2, FUN = function(x) all(x == 1)))){
    X = cbind("(Intercept)"=1,X)
  }

  n = nrow(X)
  p = ncol(X)

  if(det(t(X)%*%X)==0){
    print('Matrix is invertible Please Check!')
    return(NULL)
  }

  result <- solve(t(X)%*%X)%*%t(X)%*%y
  return(drop(result))
}

