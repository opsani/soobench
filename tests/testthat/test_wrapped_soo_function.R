context("wrapped_soo_function")

check_wrapped <- function(orig, wrapped) {
  expect_equal(lower_bounds(wrapped), lower_bounds(orig))
  expect_equal(upper_bounds(wrapped), upper_bounds(orig))
  expect_equal(global_minimum(wrapped), global_minimum(orig))
  expect_equal(number_of_parameters(wrapped), number_of_parameters(orig))
}

test_that("nested {recording,counting}_function", {
  fn <- generate_sphere_function(10)
  fn1 <- counting_function(recording_function(fn))
  fn2 <- recording_function(counting_function(fn))
  check_wrapped(fn, fn1)
  check_wrapped(fn, fn2)
})
