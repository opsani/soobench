##' Kotancheck function
##'
##' This is a slightly modified version of the Kotancheck test
##' function. It is the negation of the original test function. So
##' instead of maximizing it, this function has to be minimized.
##' 
##' @param x Parameter vector (5D for original function).
##' @return Value of the Kotancheck function.
##' @export
f_kotancheck <- function(x) {
    stopifnot(length(x) >= 2)
    x1 <- x[1]
    x2 <- x[2]
    -exp(-(x[2] - 1.2)^2)/(1 + (x[1] - 2.5)^2)
}

class(f_kotancheck) <- c("kotancheck_function", "soo_function")

##' @S3method lower_bounds kotancheck_function
##' @method lower_bounds kotancheck_function
##' @rdname bounds.Rd
lower_bounds.kotancheck_function <- function(x, dim) {
  c(-2.0, -1.0, rep(-5, dim-2))
}

##' @S3method upper_bounds kotancheck_function
##' @method upper_bounds kotancheck_function
##' @rdname bounds.Rd
upper_bounds.kotancheck_function <- function(x, dim) {
  c(7.0, 3.0, rep(5, dim-2))
}

##' @S3method global_minimum kotancheck_function
##' @method global_minimum kotancheck_function
##' @rdname global_minimum.Rd
global_minimum.kotancheck_function <- function(x, dim, ...) {
  stopifnot(dim >= 2)
  par <- c(2.5, 1.2, rep(NA, dim-2))
  val <- f_kotancheck(par)
  list(par=par, value=val)
}
