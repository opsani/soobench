context("eval_with_replacement")

## Create local copy of internal soobench function for test
eval_with_replacement <- soobench:::eval_with_replacement

env <- new.env()
env$a <- 5
env$b <- "bam"
test_that("Constant expressions", {
  bindings <- list(a=2, b="q")
  expect_equal(eval_with_replacement(quote(1), env, bindings), 1)
  expect_equal(eval_with_replacement(quote(a), env, bindings), 2)
  expect_equal(eval_with_replacement(quote(b), env, bindings), "q")
  expect_equal(eval_with_replacement(quote(b), env, bindings), "q")
})

test_that("Compound expressions", {
  bindings <- list(a=2, b="q")
  expect_equal(eval_with_replacement(quote(a + 1), env, bindings), 3)
  bindings <- list(a=20, b="q")
  expect_equal(eval_with_replacement(quote(a + 1), env, bindings), 21)
  expect_equal(eval_with_replacement(quote(paste0(b, "b")), env, bindings), "qb")
})

test_that("Add to evaluation environment", {
  bindings <- list(a=2, b="q")
  env <- new.env()
  eval_with_replacement(quote(x <- a), env, bindings)
  expect_equal(env$x, bindings$a)
})

test_that("Modify evaluation environment", {
  bindings <- list(a=2, b="q")
  env <- new.env()
  env$x <- 2
  eval_with_replacement(quote(x <- b), env, bindings)
  expect_equal(env$x, bindings$b)
})
