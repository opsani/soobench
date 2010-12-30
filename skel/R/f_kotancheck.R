##' Kotancheck function
##'
##' x[1] in [-2.5, 1.5],
##' x[2] in [-1.0, 3.0]
##'
##' @param x Parameter vector (5D for original function).
##' @return Value of the Kotancheck function.
##' @export
##' @author Olaf Mersmann \email{olafm@@statistik.tu-dortmund.de}
f_kotancheck <- function(x) {
  stopifnot(length(x) >= 2)
  x1 <- x[1]
  x2 <- x[2]
  exp(-2*x[2]^2) / (1.2 + x[1]) + rnorm(1, sd=sqrt(1e-4))
}

##' Create a Kotancheck problem instance.
##'
##' @param dim Dimensionality of the problem. Must be greater than or
##'   equal to two and for the original definition four.
##' @return An instance of a \code{box_constrained_problem}.
##' @export
kotancheck_problem <- function(dim=4) {
  stopifnot(dim > 2)
  box_constrained_problem(f_kotancheck,
                          lower=c(-2.5, -1.0, rep(-5, dim-2)),
                          upper=c(1.5, 3.0, rep(5, dim-2)))
}
