#' Global Optimum
#'
#' Retrieve the global minimum of a test function.
#'
#' @param fn Function to query.
#'
#' @return List with two elements. \code{par} contains the location
#' of the global minimum in the parameter space (possibly as a list
#' if there are multiple global minima) and \code{value} the function
#' value of the global minimum.
#'
#' @export
#' @rdname global_minimum
global_minimum <- function(fn)
  UseMethod("global_minimum")

#' @export
#' @method global_minimum soo_function
global_minimum.soo_function <- function(fn)
  list(par=attr(fn, "best_par"), value=attr(fn, "best_value"))

#' @export
#' @method global_minimum wrapped_soo_function
global_minimum.wrapped_soo_function <- function(fn)
  global_minimum(inner_function(fn))
