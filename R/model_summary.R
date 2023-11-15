#'Summary model
#'
#'This function is designed to summary and print the result of model. You can easily acquire the t statistics and f statistics based on the output of the function
#'
#'
#'@references
#'Wikipedia contributors. (n.d.). Student's t-test. In Wikipedia, The Free Encyclopedia. Retrieved [11/13/2023], from https://en.wikipedia.org/wiki/Student%27s_t-test
#'
#'@param model is the result of function linear_model()
#'@param show_table is a bool value indicate whether print out the result, the default value is TRUE
#'
#'@return the list of Estimated value, standard error, t value, p-value of t-test for each coefficients, R2 and Adjusted R2 for the model, which is same as parameter_t_test()
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
#' model <- linear_model(X, y)
#' result <- model_summary(model)
#'
#' print(result)
#'
#'@export
model_summary <- function(model, show_table=TRUE) {

  test_result <- parameter_t_test(model)
  summary_results <- data.frame(
    Estimate = test_result$Estimate,
    StdError = test_result$StdError,
    t_value = test_result$t_value,
    Pt = test_result$pt_value
  )

  if(show_table){
    colnames(summary_results) <- c("Estimate", "Std. Error", "t value", "Pr(>|t|)")
    print(summary_results)
    cat("F-statistic: ", test_result$f_value, " on ", model$rank - 1,
        " and ", nrow(model$model$X) - model$rank, " DF,  p-value: ", test_result$pf_value, "\n")
    cat("Multiple R-squared: ", test_result$R2, ",\tAdjusted R-squared: ", test_result$R2_adj, "\n")
  }

  return(test_result)
}
