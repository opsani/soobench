##' Rosenbrock function
##'
##' @param x parameter vector.
##' @export
##' @author David Arnu \email{david.arnu@@tu-dortmund.de}
f_rosenbrock <- function(x) {
  d <- length(x)
  z <- x + 1
  hz <- z[1:(d-1)]
  tz <- z[2:d]
  s <- sum(100 * (hz^2 - tz)^2 + (hz - 1)^2)
  return(s)
}

##' Create a Rosenbrock problem instance
##'
##' @param dim Dimensionality of the problem.
##' @return An instance of a \code{box_constrained_problem}.
##' @export
rosenbrock_problem <- function(dim) {
  stopifnot(dim > 1)
  box_constrained_problem(f_rosenbrock,
                          lower=rep(-5, dim),
                          upper=rep(10, dim))
}
