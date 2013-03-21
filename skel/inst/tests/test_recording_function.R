context("recording_function")

fn <- generate_sphere_function(2)
X <- random_parameters(10, fn)

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
  expect_equal(rv$par, X[, rv$time])
  expect_equal(rv$value, y[rv$time])
})

test_that("Predicate recording on value", {
  pv <- function(par, value, time)
    value < 0.5
  fn <- recording_function(fn, predicate=pv)
  y <- fn(X)
  rv <- recorded_values(fn)
  expect_equal(rv$time, which(y < 0.5))
  expect_equal(rv$par, X[, rv$time])
  expect_equal(rv$value, y[rv$time])
})
