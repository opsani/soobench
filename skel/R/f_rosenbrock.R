##' Rosenbrock function
##'
##' @param x parameter vector.
##' @return Value of the Rosenbrock function.
##' @export
f_rosenbrock <- function(x) {
  d <- length(x)
  hx <- x[1:(d-1)]
  tx <- x[2:d]
  sum(100 * (hx^2 - tx)^2 + (hx - 1)^2)
}

class(f_rosenbrock) <- c("rosenbrock_function", "soo_function")

##' @S3method lower_bounds rosenbrock_function
##' @method lower_bounds rosenbrock_function
##' @rdname bounds.Rd
lower_bounds.rosenbrock_function <- function(x, dim)
  rep(-5, dim)

##' @S3method upper_bounds rosenbrock_function
##' @method upper_bounds rosenbrock_function
##' @rdname bounds.Rd
upper_bounds.rosenbrock_function <- function(x, dim)
  rep(10, dim)

##' @method global_minimum rosenbrock_function
##' @S3method global_minimum rosenbrock_function
##' @rdname global_minimum.Rd
global_minimum.rosenbrock_function <- function(x, dim, ...)
  list(par=rep(1, dim), value=0)
