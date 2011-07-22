##' Goldstein-Price function
##' 
##' @param x Parameter vector.
##' @return Value of the Goldstein-Price function.
##' @export
f_goldsteinprice <- function(x) {
  stopifnot(length(x) == 2)
  (1 + (x[1]+x[2]+1)^2 * (19 - 14*x[1] + 3*x[1]^2 - 14*x[2] + 6*x[1]*x[2] + 3*x[2]^2)) *
    (30 + (2*x[1] - 3*x[2])^2 * (18 - 32*x[1] + 12*x[1]^2 + 48*x[2] - 36*x[1]*x[2] + 27*x[2]^2))
}
  
class(f_goldsteinprice) <- c("goldsteinprice_function", "soo_function")

##' @method lower_bounds goldsteinprice_function
##' @S3method lower_bounds goldsteinprice_function
##' @rdname bounds.Rd
lower_bounds.goldsteinprice_function <- function(x, dim) {
  stopifnot(dim == 2)
  rep(-2, dim)
}

##' @method upper_bounds goldsteinprice_function
##' @S3method upper_bounds goldsteinprice_function
##' @rdname bounds.Rd
upper_bounds.goldsteinprice_function <- function(x, dim) {
  stopifnot(dim == 2)
  rep(2, dim)
}

##' @method global_minimum goldsteinprice_function
##' @S3method global_minimum goldsteinprice_function
##' @rdname global_minimum.Rd
global_minimum.goldsteinprice_function <- function(x, dim, ...) {
  stopifnot(dim == 2)
  list(par=c(0,-1), value=3)
}
