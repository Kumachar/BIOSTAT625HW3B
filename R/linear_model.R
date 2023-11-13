#'Linear Model
#'
#'This function is designed to obtain the result of linear regression
#'
#'@param X is a matrix of input features, each row represents an observation
#'@param y is nums of parameters you obtained from linear regression
#'@param intercept is a bool value denotes if model contain an intercept
#'@return the result list of linear regression
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

linear_model <- function(X,y,intercept=TRUE){

  coefficients <- Linear_regression(X,y,intercept)
  fitted.values <- linear_prediction(X,coefficients,intercept)
  residuals <- y-fitted.values

  return(list(coefficients=coefficients,fitted.values=fitted.values,residuals=residuals, model=data.frame(cbind(X,y)),intercept=intercept))
}
