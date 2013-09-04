check_fun <- function(fn) {
  context(function_id(fn))
  lbl <- sprintf("%s can handle vectorized_input", function_id(fn))
  test_that(lbl, {
    X <- random_parameters(100, fn)
    Y1 <- apply(X, 2, fn)
    Y2 <- fn(X)
    expect_equal(length(Y1), 100)
    expect_equal(length(Y2), 100)
    expect_equal(Y1, Y2)
  })

  lbl <- sprintf("%s optimum matches expected value", function_id(fn))
  test_that(lbl, {
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
  })
}

check_fun(generate_beale_function())
check_fun(generate_branin_function())
check_fun(generate_goldstein_price_function())
check_fun(generate_himmelblau_function())
check_fun(generate_kotanchek_function())

for (dim in c(1, 2, 3, 5, 10, 20)) {
  check_fun(generate_ackley_function(dim))
  check_fun(generate_double_sum_function(dim))
  check_fun(generate_ellipsoidal_function(dim))
  check_fun(generate_griewank_function(dim))
  check_fun(generate_mexican_hat_function(dim))
  check_fun(generate_rastrigin_function(dim))
  check_fun(generate_rosenbrock_function(dim))
  ##check_fun(schwefel_function(dim))
  check_fun(generate_sphere_function(dim))
  check_fun(generate_weierstrass_function(dim))
  check_fun(generate_generalized_maxq_function(dim))
  check_fun(generate_generalized_mxhilb_function(dim))
##  check_fun(generate_chained_LQ_function(dim))
##  check_fun(generate_chained_CB3_I_function(dim))
##  check_fun(generate_chained_CB3_II_function(dim))
##  check_fun(generate_number_of_active_faces_function(dim))
}

if (Sys.getenv("SKIP_BBOB") != "1") {
  for (dim in c(2, 3, 5, 10, 20)) {
    for (fid in 1:24) {
      for (tid in 1:15) {
        check_fun(generate_bbob2009_function(dim, fid, tid))
      }
    }
  }
}

if (FALSE) {
### Tests for happyCat and batman function
for (dim in c(2, 3, 5, 10, 20)) {
  for (alpha in seq(0.1, 1, by=0.05)) {
    check_fun(generate_happycat_function(dim, alpha))
    check_fun(generate_batman_function(dim, alpha))
  }
}
}
