test_that("multiplication works", {

  X <- mtcars[, c("hp", "wt")]
  y <- mtcars$mpg
  model1 <- linear_model(X,y)
  model2 <- lm(mpg~hp+wt,data = mtcars)
  model1$
  rsum <- summary(model2)
  testresult <- parameter_t_test(model1)

  expect_equal(testresult$Estimate, rsum$coefficients[,'Estimate'],tolerance = 1e-6)
  expect_equal(testresult$StdError, rsum$coefficients[,'Std. Error'],tolerance = 1e-6)
  expect_equal(testresult$t_value, rsum$coefficients[,'t value'],tolerance = 1e-6)
  expect_equal(testresult$pt_value, rsum$coefficients[,'Pr(>|t|)'],tolerance = 1e-6)
  expect_equal(testresult$f_value, as.numeric(rsum$fstatistic[1]),tolerance = 1e-6)
  expect_equal(testresult$pf_value, as.numeric(pf(rsum$fstatistic[1], rsum$fstatistic[2],rsum$fstatistic[3], lower.tail = F)),tolerance = 1e-6)
  expect_equal(testresult$R2, rsum$r.squared, tolerance = 1e-6)
  expect_equal(testresult$R2_adj, rsum$adj.r.squared, tolerance = 1e-6)
  X <- cbind(1,X)
  model1 <- linear_model(X,y)
  rsum <- summary(model2)
  testresult <- parameter_t_test(model1)

  expect_equal(testresult$Estimate, rsum$coefficients[,'Estimate'],tolerance = 1e-6, ignore_attr = TRUE)
  expect_equal(testresult$StdError, rsum$coefficients[,'Std. Error'],tolerance = 1e-6, ignore_attr = TRUE)
  expect_equal(testresult$t_value, rsum$coefficients[,'t value'],tolerance = 1e-6, ignore_attr = TRUE)
  expect_equal(testresult$pt_value, rsum$coefficients[,'Pr(>|t|)'],tolerance = 1e-6, ignore_attr = TRUE)
})
