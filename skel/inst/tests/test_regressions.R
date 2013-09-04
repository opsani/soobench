context("Regression tests")

########################################################################
test_that("1D random_parameters()", {
  fn <- generate_sphere_function(1)
  X <- random_parameters(10, fn)
  expect_equal(dim(X), c(1, 10))
  X <- random_parameters(1, fn)
  expect_equal(dim(X), c(1, 1))
  X <- random_parameters(100, fn)
  expect_equal(dim(X), c(1, 100))
})
