##' Discus Function
##' 
##' @param x parameter vector.
##' @return Value of the Discus function.
##' @export
f_discus <- function(x)
  1e6 * x[1]^2 + sum(x*x)

class(f_discus) <- c("discus_function", "soo_function")

##' @S3method lower_bounds discus_function
##' @method lower_bounds discus_function
##' @rdname bounds.Rd
lower_bounds.discus_function <- function(x, dim)
  rep(-32.768, dim)

##' @S3method upper_bounds discus_function
##' @method upper_bounds discus_function
##' @rdname bounds.Rd
upper_bounds.discus_function <- function(x, dim)
  rep(32.768, dim)

##' @S3method global_minimum discus_function
##' @method global_minimum discus_function
##' @rdname global_minimum.Rd
global_minimum.discus_function <- function(x, dim, ...)
  list(par=rep(0, dim), value=0)
