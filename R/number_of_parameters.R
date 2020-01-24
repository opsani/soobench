#' Number of parameters
#'
#' Return the parameter space size of a function.
#'
#' @param fn [\code{soo_function}]\cr Function.
#'
#' @return Expected length of first argument. I.e. the size of the
#' parameter space of the function \code{fn}.
#'
#' @export
number_of_parameters <- function(fn)
  UseMethod("number_of_parameters")

#' @export
#' @method number_of_parameters soo_function
number_of_parameters.soo_function <- function(fn)
  attr(fn, "dimensions")

#' @export
#' @method number_of_parameters wrapped_soo_function
number_of_parameters.wrapped_soo_function <- function(fn)
  number_of_parameters(inner_function(fn))
