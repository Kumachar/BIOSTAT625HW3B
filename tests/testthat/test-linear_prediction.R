test_that("linear model predictions are consistent", {
  model <- lm(mpg ~ hp + wt, data = mtcars)
  lmresult <- predict(model, mtcars[c('hp', 'wt')])
  X <- mtcars[, c("hp", "wt")]
  y <- mtcars$mpg
  b <- Linear_regression(X,y,intercept=TRUE)
  expect_equal(linear_prediction(X, b), lmresult, tolerance = 1e-6)

  X1<-cbind(1,X)
  expect_equal(linear_prediction(X1, b), lmresult, tolerance = 1e-6)
})
