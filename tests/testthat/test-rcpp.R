test_that("testrcpp", {
  X = diag(3,3)
  expect_equal(invertMatrix(X),solve(X),tolerance = 1e-6, ignore_attr = TRUE)
})
