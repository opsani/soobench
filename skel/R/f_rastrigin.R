##' Rastrigin function
##' 
##' @param x Parameter vector.
##' @return Value of the Rastrigin function.
##' @export
##' @author David Arnu \email{david.arnu@@tu-dortmund.de}
##' @export
f_rastrigin <- function(x)
  sum(x*x - 10 * cos(2*pi*x) + 10)

##' Create a Rastrigin problem instance
##'
##' @param dim Dimensionality of the problem.
##' @return An instance of a \code{box_constrained_problem}.
##' @export
rastrigin_problem <- function(dim=10) {
  box_constrained_problem(f_rastrigin,
                          lower=rep(-5, dim),
                          upper=rep(5, dim))
}
