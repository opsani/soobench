context("function_id")

test_that("Wrapping works.", {
  fn <- generate_sphere_function(10)
  wfn <- counting_function(fn)
  expect_equal(function_id(wfn),function_id(fn))
})
