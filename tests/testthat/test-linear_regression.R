test_that("multiplication works", {
  model1 = lm(mpg~hp+wt, data = mtcars)
  x = data.matrix(mtcars[,c('hp','wt')])
  y = data.matrix(mtcars[,c('mpg')])
  expect_equal(Linear_regression(x,y), model1$coefficients, tolerance = 1e-6)

  model2 = lm(mpg~hp+wt-1, data = mtcars)
  expect_equal(Linear_regression(x,y,intercept = FALSE), model2$coefficients, tolerance = 1e-6)

})
