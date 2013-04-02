##' Retrieve the lower or upper bounds of a test function.
##'
##' @param fn Object of type \code{\link{soo_function}} to query.
##' @return [\code{numeric}] Vector of lower or upper bounds of test function.
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
lower_bounds.soo_function <- function(fn)
  attr(fn, "lower_bounds")

##' @S3method lower_bounds wrapped_soo_function
##' @method  lower_bounds wrapped_soo_function
lower_bounds.wrapped_soo_function <- function(fn)
  lower_bounds(inner_function(fn))

##' @S3method upper_bounds soo_function
##' @method  upper_bounds soo_function
upper_bounds.soo_function <- function(fn)
  attr(fn, "upper_bounds")

##' @S3method upper_bounds wrapped_soo_function
##' @method  upper_bounds wrapped_soo_function
upper_bounds.wrapped_soo_function <- function(fn)
  upper_bounds(inner_function(fn))
