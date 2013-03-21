context("find_soo_function")

## Create local copy of internal function for tests
find_soo_functions <- soobench:::find_soo_functions

fn1 <- generate_sphere_function(10)
fn2 <- recording_function(fn1)

test_that("Find soo_function in simple expressions", {
  expect_equal(find_soo_functions(quote(fn1)), c("fn1"))
  expect_equal(find_soo_functions(quote(fn2)), c("fn2"))
})

test_that("Find soo_function in call", {
  expect_equal(find_soo_functions(quote(fn1(x))), c("fn1"))
  expect_equal(find_soo_functions(quote(fn2(x))), c("fn2"))
})

test_that("Find soo_function in nested expression", {
  expect_equal(find_soo_functions(quote(((fn1(x))))), c("fn1"))
  expect_equal(find_soo_functions(quote(((fn2(x))))), c("fn2"))
})

test_that("Find soo_function in optim call", {
  expect_equal(find_soo_functions(quote(optim(par, fn1))), c("fn1"))
  expect_equal(find_soo_functions(quote(optim(par, fn2))), c("fn2"))
})

test_that("Find multiple soo_functions", {
  expr <- quote(c(fn1, fn2))
  expect_equal(find_soo_functions(expr), c("fn1", "fn2"))
  
  expr <- quote({a(fn1); fn2(x)})
  expect_equal(find_soo_functions(expr), c("fn1", "fn2"))
})
