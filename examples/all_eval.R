library("soobench")

smessage <- function(msg, ...)
  message(sprintf(msg, ...))

functions <- ls("package:soobench", pattern="generate_*")

functions <- setdiff(functions, "f_bbob2009")

for (fname in functions) {
	#FIXME: get soo_function, not soo_function_generator
  f <- get(fname)
  l <- lower_bounds(f)
  u <- upper_bounds(f)
  par <- runif(dim) * (u - l) + l

  smessage("Optimizing %s...", fname)
  res <- optim(par, f, lower=l, upper=u, method="L-BFGS-B")
  
  opt <- global_minimum(f, dim)
  if (all(is.finite(opt$par)))
    smessage("Delta: %f", crossprod(opt$par - res$par))
  else
    smessage("Delta: NA")
}
