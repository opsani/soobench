##' Retrieve the lower or upper bounds of a test function.
##'
##' @param fn Function to query.
##' @return Vector of lower or upper bounds of test function.
##' @export
##' @rdname bounds
lower_bounds <- function(fn)
  UseMethod("lower_bounds")

##' @export
##' @rdname bounds
upper_bounds <- function(fn)
  UseMethod("upper_bounds")

##' @S3method lower_bounds soo_function
##' @method  lower_bounds soo_function
##' @rdname bounds
lower_bounds.soo_function <- function(fn) attr(fn, "lower_bounds")

##' @S3method upper_bounds soo_function
##' @method  upper_bounds soo_function
##' @rdname bounds
upper_bounds.soo_function <- function(fn) attr(fn, "upper_bounds")

##' Retrieve the global minimum of a function.
##' 
##' @param fn Function to query.
##' 
##' @return List with two elements. \code{par} contains the location
##' of the global minimum in the parameter space (possibly as a list
##' if there are multiple global minima) and \code{value} the function
##' value of the global minimum.
##' 
##' @export
##' @rdname global_minimum
global_minimum <- function(fn)
  UseMethod("global_minimum")

##' @S3method global_minimum soo_function
##' @method  global_minimum soo_function
##' @rdname global_minimum
global_minimum.soo_function <- function(fn)
  list(par=attr(fn, "best_par"), value=attr(fn, "best_value"))

##' Get a pretty function name for a benchmark function.
##'
##' @param fn Function to name.
##' @return Name of function.
##' @export
##' @rdname function_name
function_name <- function(fn)
  UseMethod("function_name")    

##' @S3method function_name soo_function
##' @method function_name soo_function
##' @rdname function_name
function_name.soo_function <- function(fn) {
  basename <- attr(fn, "name")
  dim <- attr(fn, "dimensions")
  sprintf("%iD %s function", dim, basename)
}

##' @S3method function_name soo_function_generator
##' @method function_name soo_function_generator
##' @rdname function_name
function_name.soo_function_generator <- function(fn)
  attr(fn, "name")

##' Get a short id for the function that can be used in filenames and
##' such. 
##'
##' @param fn Function to name.
##' @return ID of function. Guaranteed to be unique among all test
##' functions.
##' @export
##' @rdname function_id
function_id <- function(fn)
  UseMethod("function_id")    

##' @S3method function_id soo_function
##' @method function_id soo_function
##' @rdname function_id
function_id.soo_function <- function(fn)
  attr(fn, "id")

##' @S3method function_id soo_function_generator
##' @method function_id soo_function_generator
##' @rdname function_id
function_id.soo_function_generator <- function(fn) {
  attr(fn, "id")
}

##' Returns wether \code{fn} is a generator for a single objective
##' optimization function.
##'
##' @param fn Function.
##' @return \code{TRUE} if \code{fn} is a function generator and
##'   \code{FALSE} otherwise.
##' @export
is_function_generator <- function(fn)
  inherits(fn, "soo_function_generator")

##' Return the parameter space size of a
##' function.
##'
##' @param fn Function.
##' @return Expected length of first argument. I.e. the size of the
##' parameter space of the function \code{fn}.
##' @export
##' @rdname number_of_parameters
number_of_parameters <- function(fn)
  UseMethod("number_of_parameters")

##' @S3method number_of_parameters soo_function
##' @method number_of_parameters soo_function
##' @rdname number_of_parameters
number_of_parameters.soo_function <- function(fn)
  attr(fn, "dimensions")  

##' Generate random parameter(s) for a given function.
##'
##' Given a test function \code{fn}, generate \code{n} random
##' parameter settings for that function.
##'
##' @param n Number of parameters to generate.
##' @param fn Test function.
##'
##' @return For \code{random_parameters}, a matrix containing the
##' parameter settings in the \emph{columns} of the
##' matrix. \code{random_parameter} returns a numeric vector with a
##' single parameter setting for the given function.
##'
##' @examples
##' fn <- generate_ackley_function(10)
##' X <- random_parameters(100, fn)
##' str(X)
##' y <- fn(X)
##' 
##' @export
##' @rdname random_parameters
random_parameters <- function(n, fn)
  UseMethod("random_parameters", fn)

##' @S3method random_parameters soo_function
##' @method random_parameters soo_function
random_parameters.soo_function <- function(n, fn)
  replicate(n, runif(number_of_parameters(fn),
                     lower_bounds(fn),
                     upper_bounds(fn)))

##' @export
##' @rdname random_parameters
random_parameter <- function(fn) 
  random_parameters(1, fn)[,1]
