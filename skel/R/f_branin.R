##' Branin function.
##'
##' @param x Parameter vector.
##' @return Value of the Branin function.
##' @export
f_branin <- function(x) {
  stopifnot(length(x) == 2)
  x1 <- x[1]
  x2 <- x[2]
  a <- 1
  b <- 5.1 / (2*pi)^2
  c <- 5 / pi
  d <- 6
  e <- 10
  f <- 1 / (8 * pi)
  a * (x2 - b * x1^2 + c * x1 - d)^2 + e * (1 - f) * cos(x1) + e
}

class(f_branin) <- c("branin_function", "soo_function")

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
