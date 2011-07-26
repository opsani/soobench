soo_function <- function(name, id, fun, dimensions,
                         lower_bounds, upper_bounds,
                         best_value, best_par) {
  structure(fun, name=name, id=id, dimensions=dimensions,
            class=c("soo_function", class(fun)),
            lower_bounds=lower_bounds,
            upper_bounds=upper_bounds,
            best_par=best_par, best_value=best_value)
}


##' Retrieve the lower or upper bounds of a test function.
##'
##' @param fn Function to query.
##' @return Vector of lower or upper bounds of test function.
##' @export
##' @rdname bounds.Rd
lower_bounds <- function(fn)
  UseMethod("lower_bounds")

##' @export
##' @rdname bounds.Rd
upper_bounds <- function(fn)
  UseMethod("upper_bounds")

##' @S3method lower_bounds soo_function
##' @method  lower_bounds soo_function
##' @rdname bounds.Rd
lower_bounds.soo_function <- function(fn) attr(fn, "lower_bounds")

##' @S3method upper_bounds soo_function
##' @method  upper_bounds soo_function
##' @rdname bounds.Rd
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
##' @rdname global_minimum.Rd
global_minimum <- function(fn)
  UseMethod("global_minimum")

##' @S3method global_minimum soo_function
##' @method  global_minimum soo_function
##' @rdname global_minimum.Rd
global_minimum.soo_function <- function(fn)
  list(par=attr(fn, "best_par"), value=attr(fn, "best_value"))

##' Get a pretty function name for a benchmark function.
##'
##' @param fn Function to name.
##' @return Name of function.
##' @export
##' @rdname function_name.Rd
function_name <- function(fn)
  UseMethod("function_name")    

##' @S3method function_name soo_function
##' @method function_name soo_function
##' @rdname function_name.Rd
function_name.soo_function <- function(fn) {
  basename <- attr(fn, "name")
  dim <- attr(fn, "dimensions")
  sprintf("%iD %s function", dim, basename)
}

##' Get a short id for the function that can be used in filenames and
##' such. 
##'
##' @param fn Function to name.
##' @return ID of function. Guaranteed to be unique among all test functions.
##' @export
##' @rdname function_id.Rd
function_id <- function(fn)
  UseMethod("function_id")    

##' @S3method function_id soo_function
##' @method function_id soo_function
##' @rdname function_id.Rd
function_id.soo_function <- function(fn)
  attr(fn, "id")

##' Return the parameter space size of a function.
##'
##' @param fn Function.
##' @return Expected length of first argument. I.e. the size of the
##' parameter space of the function \code{fn}.
##' @export
##' @rdname number_of_parameters.Rd
number_of_parameters <- function(fn)
  UseMethod("number_of_parameters")

##' @S3method number_of_parameters soo_function
##' @method number_of_parameters soo_function
##' @rdname number_of_parameters.Rd
number_of_parameters.soo_function <- function(fn)
  attr(fn, "dimensions")  
