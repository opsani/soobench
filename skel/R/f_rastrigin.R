##' Rastrigin function
##' 
##' @param x Parameter vector.
##' @return Value of the Rastrigin function.
##' @export
f_rastrigin <- function(x)
  sum(x*x - 10 * cos(2*pi*x) + 10)

class(f_rastrigin) <- c("rastrigin_function", "soo_function")

##' @method lower_bounds rastrigin_function
##' @S3method lower_bounds rastrigin_function
##' @rdname bounds.Rd
lower_bounds.rastrigin_function <- function(x, dim)
  rep(-5, dim)

##' @method upper_bounds rastrigin_function
##' @S3method upper_bounds rastrigin_function
##' @rdname bounds.Rd
upper_bounds.rastrigin_function <- function(x, dim)
  rep(5, dim)

##' @method global_minimum rastrigin_function
##' @S3method global_minimum rastrigin_function
##' @rdname global_minimum.Rd
global_minimum.rastrigin_function <- function(x, dim, ...)
  list(par=rep(0, dim), value=0)
