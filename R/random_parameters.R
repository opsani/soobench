#' Random parameter generation
#'
#' Generate random parameter(s) for a given function.
#'
#' Given a test function \code{fn}, generate \code{n} random
#' parameter settings for that function.
#'
#' @param n [\code{integer(1)}]\cr Number of parameters to generate.
#' @param fn [\code{soo_function}] Test function.
#'
#' @return For \code{random_parameters}, a matrix containing the
#' parameter settings in the \emph{columns} of the
#' matrix. \code{random_parameter} returns a numeric vector with a
#' single parameter setting for the given function.
#'
#' @examples
#' fn <- generate_ackley_function(10)
#' X <- random_parameters(100, fn)
#' str(X)
#' y <- fn(X)
#' 
#' @export
#' @rdname random_parameters
random_parameters <- function(n, fn)
  UseMethod("random_parameters", fn)

#' @export
#' @method random_parameters soo_function
random_parameters.soo_function <- function(n, fn) {
  X <- replicate(n, runif(number_of_parameters(fn),
                          lower_bounds(fn),
                          upper_bounds(fn)))
  ## This block is only necessary because replicate simplifies for
  ## convinence and not for correctness. Instead of returning a 1
  ## column matrix, it returns a vector.
  if (is.matrix(X))
    X
  else {
    ## Handle 1D case :/
    dim(X) <- c(1, length(X))
    X
  }
}

#' @export
#' @method random_parameters wrapped_soo_function
random_parameters.wrapped_soo_function <- function(n, fn)
  random_parameters(n, inner_function(fn))

#' @export
#' @rdname random_parameters
random_parameter <- function(fn) 
  random_parameters(1, fn)[,1]
