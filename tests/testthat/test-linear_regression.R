library(testthat)
test_that("multiplication works", {



  expect_equal(Linear_regression(mtcars[,c('hp','wt')],mtcars[,c('mpg')]),
               lm(mpg~hp+wt, data = mtcars)$coefficients, tolerance = 1e-6)

  expect_equal(Linear_regression(data.matrix(mtcars[,c('hp','wt')]),data.matrix(mtcars[,c('mpg')])),
               lm(mpg~hp+wt, data = mtcars)$coefficients, tolerance = 1e-6)

  expect_equal(Linear_regression(data.matrix(mtcars[,c('hp','wt')]),data.matrix(mtcars[,c('mpg')]),intercept = FALSE),
               lm(mpg~hp+wt-1, data = mtcars)$coefficients, tolerance = 1e-6)

  expect_equal(Linear_regression(cbind(1,1,data.matrix(mtcars[,c('hp','wt')])),data.matrix(mtcars[,c('mpg')])),
               NULL, tolerance = 1e-6)
  #Rcpp
  expect_equal(Linear_regression(mtcars[,c('hp','wt')],mtcars[,c('mpg')],rcpp = T),
               lm(mpg~hp+wt, data = mtcars)$coefficients, tolerance = 1e-6, ignore_attr = TRUE)
})
