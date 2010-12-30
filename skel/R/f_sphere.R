##' Sphere function
##'
##' \deqn{f(x) = x'x}
##'
##' @param x Parameter vector.
##' @return Value of the sphere function.
##' @export
f_sphere <- function(x)
  crossprod(x)

##' Create a sphere problem instance
##'
##' @param dim Dimensionality of the problem.
##' @return An instance of a \code{box_constrained_problem}.
##' @export
sphere_problem <- function(dim) {
  stopifnot(dim > 1)
  box_constrained_problem(f_sphere,
                          lower=rep(-5, dim),
                          upper=rep(5, dim))
}
