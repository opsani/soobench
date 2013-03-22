context("counting_function")

f <- generate_sphere_function(10)

test_that("Generics work", {
  fn <- counting_function(f)
  expect_equal(lower_bounds(fn), lower_bounds(f))
  expect_equal(upper_bounds(fn), upper_bounds(f))
  expect_equal(global_minimum(fn), global_minimum(f))
  expect_equal(number_of_parameters(fn), number_of_parameters(f))
  expect_equal(function_id(fn), function_id(f))
  expect_equal(function_name(fn), function_name(f))
})
         
test_that("Basic counting", {
  fn <- counting_function(f)
  expect_equal(number_of_evaluations(fn), 0L)
  
  fn(random_parameters(10, f))
  expect_equal(number_of_evaluations(fn), 10L)

  fn(random_parameters(2, f))
  expect_equal(number_of_evaluations(fn), 12L)
})

test_that("Counter reset", {
  fn <- counting_function(f)
  fn(random_parameters(10, f))
  expect_equal(number_of_evaluations(fn), 10L)
  reset_evaluation_counter(fn)
  expect_equal(number_of_evaluations(fn), 0L)
})
