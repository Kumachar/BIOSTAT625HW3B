% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/model_summary.R
\name{model_summary}
\alias{model_summary}
\title{Summary model}
\usage{
model_summary(model, show_table = TRUE)
}
\arguments{
\item{model}{is the result of function linear_model()}

\item{show_table}{is a bool value indicate whether print out the result, the default value is TRUE}
}
\value{
the list of Estimated value, standard error, t value, p-value of t-test for each coefficients, R2 and Adjusted R2 for the model, which is same as parameter_t_test()
}
\description{
This function is designed to summary and print the result of model. You can easily acquire the t statistics and f statistics based on the output of the function
}
\examples{
# Load example dataset
data(mtcars)

#Use horsepower&weight to predict miles per gallon
X <- mtcars[, c("hp", "wt")]  # horsepower and weight
y <- mtcars$mpg               # miles per gallon

# Run the linear regression
model <- linear_model(X, y)
result <- model_summary(model)

print(result)

}
\references{
Wikipedia contributors. (n.d.). Student's t-test. In Wikipedia, The Free Encyclopedia. Retrieved [11/13/2023], from https://en.wikipedia.org/wiki/Student%27s_t-test
}
