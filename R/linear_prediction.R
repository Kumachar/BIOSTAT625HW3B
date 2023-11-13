#'Linear prediction
#'
#'This function is designed to obtain the prediction of linear regression
#'
#'@param X is a matrix of input features, each row represents an observation
#'@param b is nums of parameters you obtained from linear regression
#'@param intercept is a bool value denotes if model contain an intercept
#'@return the prediction \eqn{X\beta} for linear regression
#'
#'@export

linear_prediction<-function(X,b,intercept=TRUE){
  if(intercept&!any(apply(X, 2, FUN = function(x) all(x == 1)))){
    X = cbind(1,X)
  }
  if (!is.matrix(X)){
    X = data.matrix(X)
  }
  beta = matrix(data=b,ncol=1)
  return(drop(X%*%beta))
}
