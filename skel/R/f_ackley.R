##' Ackley function
##'
##' x in [-32.768, 32.768]^d
##' 
##' @param x Parameter vector.
##' @return Value of the Ackley function.
##' @export
##' @author Olaf Mersmann \email{olafm@@statistik.tu-dortmund.de}
f_ackley <- function(x) {
  a <- 20
  b <- 0.2
  c <- 2 * pi
  d <- length(x)
  c1 <- crossprod(x) / d
  c2 <- sum(c * x) / d
  -a * exp(-b * c1) - exp(c2) + a + exp(1)
}

##' Create an Ackley problem instance
##'
##' @param dim Dimensionality of the problem.
##' @return An instance of a \code{box_constrained_problem}.
##' @export
ackley_problem <- function(dim) {
  stopifnot(dim > 1)
  box_constrained_problem(f_ackley,
                          lower=rep(-5, dim),
                          upper=rep(10, dim))
}
