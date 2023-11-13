test_that("Test linear model consitency", {

  X <- mtcars[, c("hp", "wt")]
  y <- mtcars$mpg
  mymodel <- linear_model(X,y,T)
  lmmodel <- lm(mpg~hp+wt, data=mtcars)

  #Test model's result consistency with R function
  expect_equal(mymodel$coefficients, lmmodel$coefficients, tolerance = 1e-6)
  expect_equal(mymodel$fitted.values, lmmodel$fitted.values, tolerance = 1e-6)
  expect_equal(mymodel$residuals, lmmodel$residuals, tolerance = 1e-6)

  #test when input is num
  X1 <- mtcars[, c("hp")]
  names(X1) <- 'hp'
  mymodel <- linear_model(X1,y,T)
  lmmodel <- lm(y~X1, data=mtcars)

  expect_equal(mymodel$coefficients, lmmodel$coefficients, tolerance = 1e-6,ignore_attr = TRUE)
  expect_equal(mymodel$fitted.values, lmmodel$fitted.values, tolerance = 1e-6,ignore_attr = TRUE)
  expect_equal(mymodel$residuals, lmmodel$residuals, tolerance = 1e-6,ignore_attr = TRUE)

  #Test when input contains NA
  X1 <- c(X1,NA)
  y <- c(y,NA)
  mymodel <- linear_model(X1,y,T)
  lmmodel <- lm(y~X1, data=mtcars)
  expect_equal(mymodel$coefficients, lmmodel$coefficients, tolerance = 1e-6,ignore_attr = TRUE)
  expect_equal(mymodel$fitted.values, lmmodel$fitted.values, tolerance = 1e-6,ignore_attr = TRUE)
  expect_equal(mymodel$residuals, lmmodel$residuals, tolerance = 1e-6,ignore_attr = TRUE)
  expect_equal(mymodel$remove_observation$reomved_row, 33, ignore_attr = TRUE)
  expect_equal(mymodel$remove_observation$removed_NA_obser, 1, ignore_attr = TRUE)

  X1 <- c(X1,NA)
  y <- c(y,NA)

  mymodel <- linear_model(X1,y,T)
  lmmodel <- lm(y~X1, data=mtcars)
  expect_equal(mymodel$coefficients, lmmodel$coefficients, tolerance = 1e-6,ignore_attr = TRUE)
  expect_equal(mymodel$fitted.values, lmmodel$fitted.values, tolerance = 1e-6,ignore_attr = TRUE)
  expect_equal(mymodel$residuals, lmmodel$residuals, tolerance = 1e-6,ignore_attr = TRUE)
  expect_equal(mymodel$remove_observation$reomved_row, c(33,34), ignore_attr = TRUE)
  expect_equal(mymodel$remove_observation$removed_NA_obser, 2, ignore_attr = TRUE)
})
