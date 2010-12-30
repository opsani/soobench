##' Kotancheck function
##'
##' @param x Parameter vector (5D for original function).
##' @return Value of the Kotancheck function.
##' @export
f_kotancheck <- function(x) {
  stopifnot(length(x) >= 2)
  x1 <- x[1]
  x2 <- x[2]
  exp(-2*x[2]^2) / (1.2 + x[1]) + rnorm(1, sd=sqrt(1e-4))
}

class(f_kotancheck) <- "kotancheck_function"

##' @S3method lower_bounds kotancheck_function
##' @method lower_bounds kotancheck_function
##' @rdname bounds.Rd
lower_bounds.kotancheck_function <- function(x, dim) {
  c(-2.5, -1.0, rep(-5, dim-2))
}

##' @S3method upper_bounds kotancheck_function
##' @method upper_bounds kotancheck_function
##' @rdname bounds.Rd
upper_bounds.kotancheck_function <- function(x, dim) {
  c(1.5, 3.0, rep(5, dim-2))
}

##' @S3method global_minimum kotancheck_function
##' @method global_minimum kotancheck_function
##' @rdname global_minimum.Rd
global_minimum.kotancheck_function <- function(x, dim, ...)
  list(par=rep(NA, dim), value=NA)
