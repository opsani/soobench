context("recording_function")

fn <- generate_sphere_function(2)
X <- random_parameters(10, fn)

test_that("Generics work", {
  rfn <- recording_function(fn)
  expect_equal(lower_bounds(rfn), lower_bounds(fn))
  expect_equal(upper_bounds(rfn), upper_bounds(fn))
  expect_equal(global_minimum(rfn), global_minimum(fn))
  expect_equal(number_of_parameters(rfn), number_of_parameters(fn))
  expect_equal(function_id(rfn), function_id(fn))
  expect_equal(function_name(rfn), function_name(fn))
})

test_that("Simple recording", {
  fn <- recording_function(fn)
  y <- fn(X)
  rv <- recorded_values(fn)
  expect_equal(rv$par, X)
  expect_equal(rv$value, y)
  expect_equal(rv$time, 1:length(y))
})

test_that("Predicate recording on time", {
  pv <- function(par, value, time)
    time %% 3 == 0
  fn <- recording_function(fn, predicate=pv)
  y <- fn(X)
  rv <- recorded_values(fn)
  expect_equal(rv$time %% 3, rep(0, length(rv$time)))
  expect_equal(rv$par, X[, rv$time, drop=FALSE])
  expect_equal(rv$value, y[rv$time])
})

test_that("Predicate recording on value", {
  pv <- function(par, value, time)
    value < 0.5
  fn <- recording_function(fn, predicate=pv)
  y <- fn(X)
  rv <- recorded_values(fn)
  expect_equal(rv$time, which(y < 0.5))
  expect_equal(rv$par, X[, rv$time, drop=FALSE])
  expect_equal(rv$value, y[rv$time])
})
