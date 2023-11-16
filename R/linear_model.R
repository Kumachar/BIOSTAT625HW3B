#'Linear Model
#'
#'This function is designed to obtain the result of linear regression
#'
#'@param X is a matrix of input features, each row represents an observation
#'@param y is nums of parameters you obtained from linear regression
#'@param intercept is a bool value denotes if model contain an intercept
#'@param rcpp Whether use Rcpp, deafault is FALSE
#'@return the result list of linear regression. Notice that, result model in the return list has removed the observation with NA.
#'
#'@examples
#' #Use horsepower&weight to predict miles per gallon
#' X <- mtcars[, c("hp", "wt")]  # horsepower and weight
#' y <- mtcars$mpg               # miles per gallon
#'
#' #Generate model using designed function
#' model <- linear_model(X,y,intercept=TRUE)
#' print(model)
#'@export

linear_model <- function(X,y,intercept=TRUE,rcpp=FALSE){
  #Remove NA in the data
  if(!is.matrix(X)){
    X = as.matrix(X)
  }
  if(!is.matrix(y)){
    y = as.matrix(y)
  }

  na_row1 = apply(X,1,FUN = function(x) any(is.na(x)))
  na_row2 = apply(y,1,FUN = function(x) any(is.na(x)))
  na_row = na_row1 | na_row2
  X = X[!na_row,,drop=FALSE]
  y = y[!na_row,]
  remove_observation = list(removed_NA_obser=sum(na_row), reomved_row=which(na_row))

  coefficients <- Linear_regression(X,y,intercept)
  fitted.values <- linear_prediction(X,coefficients,intercept)
  residuals <- y-fitted.values

  if(intercept&!any(apply(X, 2, FUN = function(x) all(x == 1)))){
    rank = ncol(X)+1
  }else{
    rank = ncol(X)
  }

  mse = sum(residuals^2)/(nrow(X)-rank)


  return(list(coefficients=coefficients,fitted.values=fitted.values,residuals=residuals, rank=rank, mse = mse,
              model=list(X=X,y=y),intercept=intercept, remove_observation=remove_observation))
}
