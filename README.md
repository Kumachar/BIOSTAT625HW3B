
<!-- README.md is generated from README.Rmd. Please edit that file -->

# HW3

<!-- badges: start -->

[![R-CMD-check](https://github.com/Kumachar/BIOSTAT625HW3B/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Kumachar/BIOSTAT625HW3B/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/Kumachar/BIOSTAT625HW3B/branch/master/graph/badge.svg)](https://app.codecov.io/gh/Kumachar/BIOSTAT625HW3B?branch=master)
<!-- badges: end -->

The goal of this package HW3 is to facilitate get linear regression
result and its analysis. It includes functions for building linear
models, making predictions, testing parameters, and summarizing model
results.

## Installation

You can install the newest version of HW3 from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Kumachar/BIOSTAT625HW3B")
```

## Function Usage

1.  **linear_model(X, y, intercept = TRUE)**: Builds a linear model.
    -   `X`: Predictor variables (matrix or data frame).
    -   `y`: Response variable (matrix or data frame).
    -   `intercept`: Whether to include the intercept (default: TRUE).
    -   Returns a list with model coefficients, fitted values,
        residuals, rank, mean squared error, model data, intercept
        inclusion status, and NA removal details.
2.  **parameter_t\_test(model)**: Conducts t-tests and F-tests on model
    parameters. –>
    -   `model`: The linear model object returned by `linear_model`.
    -   Returns a list with estimates, standard errors, t-values,
        p-values for t-tests, F-value, p-value for F-test, R², and
        adjusted R².
3.  **linear_prediction(X, b, intercept = TRUE)**: Generates predictions
    using the linear model.
    -   `X`: Predictor variables (matrix or data frame).
    -   `b`: Coefficients of the linear model.
    -   `intercept`: Whether the intercept was included in the model.
    -   Returns predicted values.
4.  **Linear_regression(X, y, intercept = TRUE)**: Helper function for
    `linear_model` to perform linear regression.
    -   `X`: Predictor variables (matrix or data frame).
    -   `y`: Response variable (matrix or data frame).
    -   `intercept`: Whether to include the intercept.
    -   Returns regression coefficients.
5.  **model_summary(model, show_table = TRUE)**: Summarizes the linear
    model.
    -   `model`: The linear model object returned by `linear_model`.
    -   `show_table`: Whether to display the summary table (default:
        TRUE).
    -   Returns test results and optional

Or you can simply find the help page of these functions after the
installation of this package by ?function_name

## Example

Here we offered an example of how to make use of these functions:

``` r
library(HW3)
## basic example code
```

Now we can display a simple example of how this package works. We are
going to use linear model to predict the Miles per gallon based on horse
power and weight of a car in mtcars data.

``` r
data("mtcars")
X <- mtcars[, c("hp", "wt")]
y <- mtcars$mpg

#Construct a Multiple Linear Regression model to predict Miles per gallon based on horse power and weight of a car
model <- linear_model(X, y, intercept = TRUE)

#Now we can see the regression coefficients for each variable you use in the model
model$coefficients
#> (Intercept)          hp          wt 
#> 37.22727012 -0.03177295 -3.87783074

#Also we can predict data based on acquired coefficients use lineaer_prediction function
head(linear_prediction(X,model$coefficients))
#>         Mazda RX4     Mazda RX4 Wag        Datsun 710    Hornet 4 Drive 
#>          23.57233          22.58348          25.27582          21.26502 
#> Hornet Sportabout           Valiant 
#>          18.32727          20.47382

#There are also some useful functions to generate the result of regression, as you can do with summary function
result<-model_summary(model)
#>                Estimate Std. Error   t value     Pr(>|t|)
#> (Intercept) 37.22727012 1.59878754 23.284689 2.565459e-20
#> hp          -0.03177295 0.00902971 -3.518712 1.451229e-03
#> wt          -3.87783074 0.63273349 -6.128695 1.119647e-06
#> F-statistic:  69.21121  on  2  and  29  DF,  p-value:  9.109054e-12 
#> Multiple R-squared:  0.8267855 , Adjusted R-squared:  0.8148396

print(result)
#> $Estimate
#> (Intercept)          hp          wt 
#> 37.22727012 -0.03177295 -3.87783074 
#> 
#> $StdError
#> (Intercept)          hp          wt 
#>  1.59878754  0.00902971  0.63273349 
#> 
#> $t_value
#> (Intercept)          hp          wt 
#>   23.284689   -3.518712   -6.128695 
#> 
#> $pt_value
#>  (Intercept)           hp           wt 
#> 2.565459e-20 1.451229e-03 1.119647e-06 
#> 
#> $f_value
#> [1] 69.21121
#> 
#> $pf_value
#> [1] 9.109054e-12
#> 
#> $R2
#> [1] 0.8267855
#> 
#> $R2_adj
#> [1] 0.8148396
```

You can compare these result with the original lm and summary function

``` r
model2 <- lm(mpg~hp+wt, data = mtcars)
model2$coefficients
#> (Intercept)          hp          wt 
#> 37.22727012 -0.03177295 -3.87783074
head(predict(model2,X))
#>         Mazda RX4     Mazda RX4 Wag        Datsun 710    Hornet 4 Drive 
#>          23.57233          22.58348          25.27582          21.26502 
#> Hornet Sportabout           Valiant 
#>          18.32727          20.47382
summary(model2)
#> 
#> Call:
#> lm(formula = mpg ~ hp + wt, data = mtcars)
#> 
#> Residuals:
#>    Min     1Q Median     3Q    Max 
#> -3.941 -1.600 -0.182  1.050  5.854 
#> 
#> Coefficients:
#>             Estimate Std. Error t value Pr(>|t|)    
#> (Intercept) 37.22727    1.59879  23.285  < 2e-16 ***
#> hp          -0.03177    0.00903  -3.519  0.00145 ** 
#> wt          -3.87783    0.63273  -6.129 1.12e-06 ***
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Residual standard error: 2.593 on 29 degrees of freedom
#> Multiple R-squared:  0.8268, Adjusted R-squared:  0.8148 
#> F-statistic: 69.21 on 2 and 29 DF,  p-value: 9.109e-12
```

*We can formally test whether they are equal*

``` r
library(testthat)
  X1 <- mtcars[, c("hp")]
  names(X1) <- 'hp'
  mymodel <- linear_model(X1,y,T)
  lmmodel <- lm(y~X1, data=mtcars)
  #For linear model related functions
  expect_equal(mymodel$coefficients, lmmodel$coefficients,ignore_attr = TRUE)
  expect_equal(mymodel$fitted.values, lmmodel$fitted.values,ignore_attr = TRUE)
  expect_equal(mymodel$residuals, lmmodel$residuals,ignore_attr = TRUE)
  
  #for summary
  rsum <- summary(lmmodel)
  testresult <- model_summary(mymodel, show_table = FALSE)
  expect_equal(testresult$Estimate, rsum$coefficients[,'Estimate'],ignore_attr = TRUE)
  expect_equal(testresult$StdError, rsum$coefficients[,'Std. Error'],tolerance = 1e-6,ignore_attr = TRUE)
  expect_equal(testresult$t_value, rsum$coefficients[,'t value'],tolerance = 1e-6,ignore_attr = TRUE)
  expect_equal(testresult$pt_value, rsum$coefficients[,'Pr(>|t|)'],tolerance = 1e-6,ignore_attr = TRUE)
  expect_equal(testresult$f_value, as.numeric(rsum$fstatistic[1]),tolerance = 1e-6,ignore_attr = TRUE)
  expect_equal(testresult$pf_value, as.numeric(pf(rsum$fstatistic[1], rsum$fstatistic[2],rsum$fstatistic[3], lower.tail = F)),tolerance = 1e-6)
  expect_equal(testresult$R2, rsum$r.squared, tolerance = 1e-6)
  expect_equal(testresult$R2_adj, rsum$adj.r.squared, tolerance = 1e-6)
  
```

Now we can see that our model’s result align with r function’s.

## Some benchmark

``` r
library(rbenchmark)
library(NHANES)
#> Warning: 程辑包'NHANES'是用R版本4.1.3 来建造的
#For linear model related functions
benchmark(Linearmodel={
           model = linear_model(NHANES[,c("Weight","Height")],NHANES[,c("BPSysAve")])
         }, 
         rcode = {
           model =lm(BPSysAve~Weight+Height, data = NHANES)
         }, 
          replications = 100, columns = c("test", "replications", "elapsed", "relative", "user.self", "sys.self"))
#>          test replications elapsed relative user.self sys.self
#> 1 Linearmodel          100    2.72   20.923      2.72     0.00
#> 2       rcode          100    0.13    1.000      0.11     0.02

benchmark(Linearmodel={
           model = linear_model(NHANES[,c("Weight","Height")],NHANES[,c("BPSysAve","Age")])
         }, 
         rcode = {
           model =lm(BPSysAve~Weight+Height, data = NHANES)
           model2 = lm(Age~Weight+Height, data = NHANES)
         }, 
          replications = 100, columns = c("test", "replications", "elapsed", "relative", "user.self", "sys.self"))
#>          test replications elapsed relative user.self sys.self
#> 1 Linearmodel          100    3.09    12.36      3.09        0
#> 2       rcode          100    0.25     1.00      0.25        0

benchmark(Linearmodel={
           fitted = linear_prediction(X1,mymodel$coefficients)
         }, 
         rcode = {
           predict(lmmodel, mtcars[, c("hp"),drop=F])
         }, 
          replications = 100, columns = c("test", "replications", "elapsed", "relative", "user.self", "sys.self"))
#>          test replications elapsed relative user.self sys.self
#> 1 Linearmodel          100    0.00       NA      0.00        0
#> 2       rcode          100    0.02       NA      0.01        0

#For summary
benchmark(Linearmodel={
           model_summary(mymodel, show_table = FALSE)
         }, 
         rcode = {
           summary(lmmodel)
         }, 
          replications = 100, columns = c("test", "replications", "elapsed", "relative", "user.self", "sys.self"))
#>          test replications elapsed relative user.self sys.self
#> 1 Linearmodel          100    0.03      1.5      0.03        0
#> 2       rcode          100    0.02      1.0      0.01        0
```

## This function can also work with other packages

``` r
#install.packages("NHANES")
#install.packages("ggplot2")

library(ggplot2)
model3 <- linear_model(NHANES[,c("Weight","Height")],NHANES[,c("BPSysAve")])
# Assuming model3 contains fitted values and coefficients
fitted_values <- model3$fitted.values
coefficients <- model3$coefficients

# Prepare a data frame for plotting
plot_data <- data.frame(
  Weight = model3$model$X[,'Weight'],
  Height = model3$model$X[,'Height'],
  BPSysAve = model3$model$y,
  FittedBPSysAve = fitted_values
)

# Plot for Weight vs BPSysAve
ggplot(plot_data, aes(x = Weight, y = BPSysAve)) + 
  geom_point() + 
  geom_line(aes(y = FittedBPSysAve), color = "blue") +
  ggtitle("Weight v.s BPSysAve")
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="100%" />

``` r
# Plot for Height vs BPSysAve
ggplot(plot_data, aes(x = Height, y = BPSysAve)) + 
  geom_point() + 
  geom_line(aes(y = FittedBPSysAve), color = "red") +
  ggtitle("Height v.s BPSysAve")
```

<img src="man/figures/README-unnamed-chunk-5-2.png" width="100%" />

## More

since our design is completely based on matrix, theoretically we can
even apply regression on multiple output, however which may introduce
calculation error(test-statistics is not available yet). Please, use
this feature carefully!

``` r
X = NHANES[,c("Weight","Height")]
y = NHANES[,c("BPSysAve","Age")]
model4 <- linear_model(X,y)
print(model4$coefficients)
#>                BPSysAve         Age
#> (Intercept) 96.47669099 20.99512354
#> Weight       0.19308885  0.22071809
#> Height       0.03967481  0.01651863

#Compared with regression individually
model_r1 <- lm(BPSysAve~Weight+Height, data = NHANES)
model_r1$coefficients
#> (Intercept)      Weight      Height 
#> 96.47669099  0.19308885  0.03967481
head(model_r1$fitted.values)
#>        1        2        3        5        6        7 
#> 119.8871 119.8871 119.8871 119.8987 107.5115 108.4549
model_r2 <- lm(Age~Weight+Height, data = NHANES)
model_r2$coefficients
#> (Intercept)      Weight      Height 
#> -23.1537289   0.2113783   0.2811055
head(model_r1$fitted.values)
#>        1        2        3        5        6        7 
#> 119.8871 119.8871 119.8871 119.8987 107.5115 108.4549
```
