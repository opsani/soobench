##' Ackley function
##'
##' @param x Parameter vector.
##' @return Value of the Ackley function.
##' @export
f_ackley <- function(x) {
  a <- 20
  b <- 0.2
  c <- 2 * pi
  d <- length(x)
  c1 <- crossprod(x) / d
  c2 <- sum(c * x) / d
  -a * exp(-b * c1) - exp(c2) + a + exp(1)
}

class(f_ackley) <- c("ackley_function", "soo_function")

##' @S3method lower_bounds ackley_function
##' @method lower_bounds ackley_function
##' @rdname bounds.Rd
lower_bounds.ackley_function <- function(x, dim)
  rep(-32.768, dim)

##' @S3method upper_bounds ackley_function
##' @method upper_bounds ackley_function
##' @rdname bounds.Rd
upper_bounds.ackley_function <- function(x, dim)
  rep(32.768, dim)

##' @S3method global_minimum ackley_function
##' @method global_minimum ackley_function
##' @rdname global_minimum.Rd
global_minimum.ackley_function <- function(x, dim, ...)
  list(par=rep(0, dim), value=0)
