library("soobench")

generators <- list(ackley_function,
                   branin_function,
                   discus_function,
                   ellipsoidal_function,
                   griewank_function,
                   kotancheck_function,
                   mexican_hat_function,
                   rastrigin_function,
                   rosenbrock_function,
                   sphere_function,
                   schwefel_function,
                   double_sum_function,
                   weierstrass_function)

plotit <- function(fn) {
  message("Plotting '", function_id(fn), "' ...")
  plot(fn, rank=TRUE, n=201^2,
       image_args=list(useRaster=TRUE),
       contour_args=list(nlevels=5))
}

pdf("soo_functions.pdf", width=10, height=10, pointsize=10)

for (generator in generators) {  
  if (length(formals(generator)) == 1) {
    f <- generator(2)
    plotit(f)
  } else {
    plotit(generator())
  }
}

## some of these fail, this is a known issue
for (fid in 1:24) {
  for (iid in 1:1) {
    f <- bbob2009_function(2, fid, iid)
    plotit(f)
  }
}

dev.off()
