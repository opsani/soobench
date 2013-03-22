#' Function name
#'
#' Get a pretty function name for a benchmark function.
#'
#' @param fn Function to name.
#' @return Name of function.
#' @export
function_name <- function(fn)
  UseMethod("function_name")    

#' @S3method function_name soo_function
function_name.soo_function <- function(fn) {
  basename <- attr(fn, "name")
  dim <- attr(fn, "dimensions")
  sprintf("%iD %s function", dim, basename)
}

##' @S3method function_name wrapped_soo_function
function_name.wrapped_soo_function <- function(fn)
  function_name(inner_function(fn))

##' @S3method function_name soo_function_generator
function_name.soo_function_generator <- function(fn)
  attr(fn, "name")
