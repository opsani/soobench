context("record_target_values_function")

fn <- generate_sphere_function(2)
fn <- record_target_values_function(fn)

X <- random_parameters(10, fn)
y <- fn(X)

test_that("Simple recording", {
  expect_equal(target_values(fn), y)
})

test_that("Reseting target values", {
  reset_target_values(fn)
  X <- random_parameters(12, fn)
  y <- fn(X)
  expect_equal(length(target_values(fn)), 12, scale=1)
  expect_equal(target_values(fn), y)
})
