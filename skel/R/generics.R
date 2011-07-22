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

##' Get a pretty function name for a benchmark function.
##'
##' @param x Function to name.
##' @param ... Ignored.
##' @return Name of function.
##' @export
##' @rdname function_name.Rd
function_name <- function(x, ...)
  UseMethod("function_name")    

##' @S3method function_name soo_function
##' @method function_name soo_function
##' @rdname function_name.Rd
function_name.soo_function <- function(x, ...) {
  nm <- strsplit(class(x)[[1]], "_")[[1]][1]
  ## Uppercase first letter:
  paste(toupper(substring(nm, 1,1)), substring(nm, 2), " function", sep="")
}

##' Get a short name for the function that can be used in filenames and such. 
##'
##' @param x Function to name.
##' @param ... Ignored.
##' @return ID of function.
##' @export
##' @rdname function_id.Rd
function_id <- function(x, ...)
  UseMethod("function_id")    

##' @S3method function_id soo_function
##' @method function_id soo_function
##' @rdname function_id.Rd
function_id.soo_function <- function(x, ...) {
  id <- strsplit(class(x)[1], "_function")[[1]]
  if (id != "soo_function")
    id
  else
    stop("ERROR: No id known for function.")
}
