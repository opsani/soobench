context("with_fixed_budget")

test_that("Generics work", {
  myfn <- generate_double_sum_function(10)
  with_fixed_budget(lb <- lower_bounds(myfn), 100L)
  expect_equal(lb, lower_bounds(myfn))

  with_fixed_budget(ub <- upper_bounds(myfn), 100L)
  expect_equal(ub, upper_bounds(myfn))

  with_fixed_budget(gm <- global_minimum(myfn), 100L)
  expect_equal(gm, global_minimum(myfn))
})

test_that("Plain soo_functions work", {
  myfn <- generate_double_sum_function(10)
  res <- with_fixed_budget(optim(random_parameter(myfn), myfn), 20L)
  expect_equal(res$counts[1], 20)
})

test_that("Wrapped counting_functions work", {
  fn <- generate_double_sum_function(10)
  fn <- counting_function(fn)
  res <- with_fixed_budget(optim(random_parameter(fn), fn), 20L)
  expect_equal(res$counts[1], number_of_evaluations(fn))
})
