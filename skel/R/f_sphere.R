##' Sphere function.
##'
##' \deqn{f(x) = x'x}
##'
##' @param x Parameter vector.
##' @return Value of the sphere function.
##' @export
f_sphere <- function(x)
  drop(crossprod(x))

class(f_sphere) <- "sphere_function"

##' @S3method lower_bounds sphere_function
##' @method lower_bounds sphere_function
##' @rdname bounds.Rd
lower_bounds.sphere_function <- function(x, dim)
  rep(-5, dim)

##' @S3method upper_bounds sphere_function
##' @method upper_bounds sphere_function
##' @rdname bounds.Rd
upper_bounds.sphere_function <- function(x, dim)
  rep(5, dim)

##' @S3method global_minimum sphere_function
##' @method global_minimum sphere_function
##' @rdname global_minimum.Rd
global_minimum.sphere_function <- function(x, dim, ...)
  list(par=rep(0, dim), value=0)
