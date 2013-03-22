##' Retrieve the inner function contained in a wrapping function.
##'
##' @details This function is a utility function that is used
##' internally by functions that wrap \code{soo_function} objects and
##' want to return \dQuote{wrapped} versions of these functions. Such
##' a \dQuote{wrapped} function should still provide all the methods
##' that are applicable to the \dQuote{inner} function. For this to
##' work in a generic fashion, we need a method to retrieve the inner
##' function and continue method dispatch on it. This generic
##' implements that interface.
##' 
##' @param fn [\code{function}]\cr Function object
##'
##' @return The inner function of \code{fn}.
inner_function <- function(fn)
  UseMethod("inner_function")

inner_function.wrapped_soo_function <- function(fn) {
  stop("Reached 'inner_function.wrapped_soo_function'.

This should never happen. Make sure that your soo_function wrapper
adds a custom class _before_ the wrapped_soo_function class and that
you have implemented a inner_function() method for that class.")
}
