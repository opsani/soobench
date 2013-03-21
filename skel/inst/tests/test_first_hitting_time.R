context("First hitting time")

test_that("numeric first hitting time", {
  expect_equal(first_hitting_times(10:1, 11), 1)
  expect_equal(first_hitting_times(10:1, 10), 1)
  expect_equal(first_hitting_times(10:1, 5), 6)
  expect_equal(first_hitting_times(10:1, 2), 9)
  expect_equal(first_hitting_times(10:1, 1), 10)

  ## Vectorized:
  expect_equal(first_hitting_times(10:1, 10:1), 1:10)
  
  ## OME: OMG, why does the type of NA trip up the test?
  expect_equal(first_hitting_times(10:1, 0), as.numeric(NA))
})

test_that("all recorded first hitting time", {
  fn <- recording_function(generate_sphere_function(2))

  X <- rbind(0, 10:0)
  y <- fn(X)
  expect_equal(first_hitting_times(fn, y), 1:11)
})

test_that("predicate recorded first hitting time", {
  pv <- function(par, value, time)
    time %% 3 == 0
  fn <- recording_function(generate_sphere_function(2), predicate=pv)

  X <- rbind(0, 8:0)
  y <- fn(X)
  expect_warning(fh <- first_hitting_times(fn, y))
  expect_equal(fh, rep(1:3, each=3) * 3)
})
