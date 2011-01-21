##' Ellipsoidal Function.
##' 
##' @param x parameter vector.
##' @return Value of the Ellipsoidal function.
##' @export
f_ellipsoidal <- function(x) {
  d <- length(x)
  c1 <- 6 * (1:d) / d
  s <- sum(10^c1 * x^2)
  return(s)
}

class(f_ellipsoidal) <- c("ellipsoidal_function", "soo_function")

##' @S3method lower_bounds ellipsoidal_function
##' @method lower_bounds ellipsoidal_function
##' @rdname bounds.Rd
lower_bounds.ellipsoidal_function <- function(x, dim)
  rep(-32.768, dim)

##' @S3method upper_bounds ellipsoidal_function
##' @method upper_bounds ellipsoidal_function
##' @rdname bounds.Rd
upper_bounds.ellipsoidal_function <- function(x, dim)
  rep(32.768, dim)

##' @S3method global_minimum ellipsoidal_function
##' @method global_minimum ellipsoidal_function
##' @rdname global_minimum.Rd
global_minimum.ellipsoidal_function <- function(x, dim, ...)
  list(par=rep(0, dim), value=0)
