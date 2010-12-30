##' Retrieve the lower or upper bounds of a test function.
##'
##' @param x Function to query.
##' @param dim Dimensionality of parameter space.
##' @return Vector of lower or upper bounds of test function.
##' @export
##' @rdname bounds.Rd
lower_bounds <- function(x, dim)
  UseMethod("lower_bounds")

##' @export
##' @rdname bounds.Rd
upper_bounds <- function(x, dim)
  UseMethod("upper_bounds")

##' Retrieve the global minimum of a function.
##' 
##' @param x Function to query.
##' @param dim Dimensionality of parameter space.
##' @param ... Further arguments passed down to the method.
##' 
##' @return List with two elements. \code{par} contains the location
##' of the global minimum in the parameter space (possibly as a list
##' if there are multiple global minima) and \code{value} the function
##' value of the global minimum.
##' 
##' @export
##' @rdname global_minimum.Rd
global_minimum <- function(x, dim, ...)
  UseMethod("global_minimum")
