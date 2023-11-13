test_that("Test linear model consitency", {

  X <- mtcars[, c("hp", "wt")]
  y <- mtcars$mpg
  mymodel <- linear_model(X,y,T)
  lmmodel <- lm(mpg~hp+wt, data=mtcars)

  #Test model's result consistency with R function
  expect_equal(mymodel$coefficients, lmmodel$coefficients, tolerance = 1e-6)
  expect_equal(mymodel$fitted.values, lmmodel$fitted.values, tolerance = 1e-6)
  expect_equal(mymodel$residuals, lmmodel$residuals, tolerance = 1e-6)

})
