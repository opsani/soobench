check_fun <- function(fn) {
  context(function_id(fn))
  X <- random_parameters(100, fn)
  Y1 <- apply(X, 2, fn)
  Y2 <- fn(X)
  expect_equal(Y1, Y2)
  opt <- global_minimum(fn)
  if (is.list(opt$par)) {
    for (par in opt$par) {
      expect_that(fn(par),
                  equals(opt$value, sprintf("opt of %s",
                                            function_id(fn))))
    }
  } else {
    expect_that(fn(opt$par),
                equals(opt$value, sprintf("opt of %s", function_id(fn))))
  }
}

check_fun(goldstein_price_function())
check_fun(branin_function())

for (dim in c(2, 3, 5, 10, 20)) {
  check_fun(generate_ackley_function(dim))
  check_fun(double_sum_function(dim))
  check_fun(ellipsoidal_function(dim))
  check_fun(griewank_function(dim))
  check_fun(kotancheck_function(dim))
  check_fun(mexican_hat_function(dim))
  check_fun(rastrigin_function(dim))
  check_fun(rosenbrock_function(dim))
  ##check_fun(schwefel_function(dim))
  check_fun(generate_sphere_function(dim))
  check_fun(weierstrass_function(dim))
}

for (dim in c(2, 3, 5, 10, 20)) {
  for (fid in 1:24) {
    for (tid in 1:15) {
      check_fun(bbob2009_function(dim, fid, tid))
    }
  }
}

# Tests for happyCat and batman function
for (dim in c(2, 3, 5, 10, 20)) {
  for (alpha in seq(0, 1, by=0.1)) {
    check_fun(generate_happycat_function(dim, alpha))
    check_fun(generate_batman_function(dim, alpha))
  }
}

# FIXME: remove ::: when exported
## f <- soobench:::record_target_values_function(generate_sphere_function(1))
## expect_equal(soobench:::target_values(f), numeric(0))
## y1 <- sapply(c(2,1,3), f)
## y2 <- soobench:::target_values(f)
## expect_equal(y1, y2)
## expect_equal(soobench:::first_hitting_times(y2, c(1, 0, 7)),
##     c(2, NA, 1)) 
## expect_equal(soobench:::first_hitting_times(y2, c(1, 10, 7)), 
##     c(1, NA, 3)) 
## soobench:::reset_target_values(f)
## expect_equal(soobench:::target_values(f), numeric(0))
