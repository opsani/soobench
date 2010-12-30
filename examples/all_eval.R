library("soobench")

smessage <- function(msg, ...)
  message(sprintf(msg, ...))

functions <- ls("package:soobench", pattern="f_*")

functions <- setdiff(functions, "f_bbob2009")

dim <- 2

for (fname in functions) {
  f <- get(fname)
  l <- lower_bounds(f, dim)
  u <- upper_bounds(f, dim)
  par <- runif(dim) * (u - l) + l

  smessage("Optimizing %s...", fname)
  res <- optim(par, f, lower=l, upper=u, method="L-BFGS-B")
  
  opt <- global_minimum(f, dim)
  if (all(is.finite(opt$par)))
    smessage("Delta: %f", crossprod(opt$par - res$par))
  else
    smessage("Delta: NA")
}
