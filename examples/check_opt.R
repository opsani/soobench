library("soobench")

generators <- list(generate_ackley_function,
                   generate_branin_function,
                   generate_discus_function,
                   generate_ellipsoidal_function,
                   generate_griewank_function,
                   generate_kotancheck_function,
                   generate_mexican_hat_function,
                   generate_rastrigin_function,
                   generate_rosenbrock_function,
                   generate_sphere_function,
                   ##generate_schwefel_function,
                   generate_double_sum_function,
                   generate_weierstrass_function)

check <- function(f, par, value) {
  delta <- f(par) - value
  if (delta <= 4 * .Machine$double.eps) {
    ## message("PASS: ", function_id(f))
  } else {
    message("FAIL: ", function_id(f), " (error=", delta, ")", sep="")
  }
}

check_function <- function(f) {
  opt <- global_minimum(f)
  if (is.list(opt$par)) {
    for (par in opt$par)
      check(f, par, opt$value)      
  } else {
    check(f, opt$par, opt$value)
  }
}

for (generator in generators) {  
  if (length(formals(generator)) == 1) {
    for (dim in c(2, 3, 5, 10, 20, 40, 100)) {
      f <- generator(dim)
      check_function(f)
    }
  } else {
    check_function(generator())
  }
}

## some of these fail, this is a known issue
for (fid in 1:24) {
  for (iid in 1:15) {
    for (dim in c(2, 3, 5, 10, 20, 40)) {
      f <- bbob2009_function(dim, fid, iid)
      check_function(f)
    }
  }
}

## some of these fail, this is a known issue
for (fid in 1:24) {
  for (iid in 1:15) {
    for (dim in c(2, 3, 5, 10, 20, 40)) {
      f <- noisy_bbob2009_function(dim, fid, iid, 1L)
      check_function(f)
    }
  }
}
