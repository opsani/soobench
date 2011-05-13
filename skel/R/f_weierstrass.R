##' Weierstrass Function.
##' 
##' @param x parameter vector.
##' @return Value of the Weierstrass function.
##' @export
f_weierstrass <- function(x) {
  d <- length(x)
  k <- 1:11
  10 * (1/d * sum((0.5)^k * cos(2*pi*3^k*(x+0.5))))^3 
}

class(f_weierstrass) <- c("weierstrass_function", "soo_function")

##' @S3method lower_bounds weierstrass_function
##' @method lower_bounds weierstrass_function
##' @rdname bounds.Rd
lower_bounds.weierstrass_function <- function(x, dim)
  rep(-32.768, dim)

##' @S3method upper_bounds weierstrass_function
##' @method upper_bounds weierstrass_function
##' @rdname bounds.Rd
upper_bounds.weierstrass_function <- function(x, dim)
  rep(32.768, dim)

##' @S3method global_minimum weierstrass_function
##' @method global_minimum weierstrass_function
##' @rdname global_minimum.Rd
global_minimum.weierstrass_function <- function(x, dim, ...)
  list(par=rep(0, dim), value=0)
