library("soobench")

generators <- list(generate_ackley_function,
                   generate_branin_function,
                   generate_discus_function,
                   generate_ellipsoidal_function,
                   generate_griewank_function,
                   generate_kotanchek_function,
                   generate_mexican_hat_function,
                   generate_rastrigin_function,
                   generate_rosenbrock_function,
                   generate_sphere_function,
                   #schwefel_function,
                   generate_double_sum_function,
                   generate_weierstrass_function)

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
    f <- generate_bbob2009_function(2, fid, iid)
    plotit(f)
  }
}

for(alpha in seq(0.1, 1, by=0.1)) {
	f <- generate_happycat_function(2, alpha)
	plotit(f)
}

for(alpha in seq(0.1, 1, by=0.1)) {
	f <- generate_batman_function(2, alpha)
	plotit(f)
}

dev.off()
