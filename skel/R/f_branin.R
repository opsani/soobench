##' Branin function.
##'
##' @param x Parameter vector.
##' @return Value of the Branin function.
##' @export
f_branin <- function(x) {
  stopifnot(length(x) == 2)
  x1 <- x[1]
  x2 <- x[2]
  c1 <- x2 - 5/(2*pi)^2 * x1^2 + 5/pi * x1 - 6
  c2 <- 10*(1 - 1/(8*pi))*cos(x1)
  c1^2 + c2 + 10
}

class(f_branin) <- "branin_function"

##' @S3method lower_bounds branin_function
##' @method lower_bounds branin_function
##' @rdname bounds.Rd
lower_bounds.branin_function <- function(x, dim) {
  stopifnot(dim == 2)
  c(-5, 0)
}

##' @S3method upper_bounds branin_function
##' @method upper_bounds branin_function
##' @rdname bounds.Rd
upper_bounds.branin_function <- function(x, dim) {
  stopifnot(dim == 2)
  c(10, 15)
}

##' @S3method global_minimum branin_function
##' @method global_minimum branin_function
##' @rdname global_minimum.Rd
global_minimum.branin_function <- function(x, dim, ...)
  list(par=list(c(-pi, 12.275), c(pi, 2.275), c(3*pi, 2.475)),
       value=0.397887)
