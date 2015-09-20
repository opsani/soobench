#' Function ID
#' 
#' Get a short id for the function that can be used in filenames and
#' such. It is guaranteed that the ID contains only \dQuote{safe}
#' characters in the range {A-Z,a-z,0-9,_,-}.
#'
#' @param fn [\code{\link{soo_function}}] Function to name.
#' @return ID of function. Guaranteed to be unique among all test
#' functions.
#' @export
function_id <- function(fn)
  UseMethod("function_id")    

#' @export
#' @method function_id soo_function
function_id.soo_function <- function(fn)
  attr(fn, "id")

#' @export
#' @method function_id wrapped_soo_function
function_id.wrapped_soo_function <- function(fn)
  function_id(inner_function(fn))

#' @export
#' @method function_id soo_function_generator
function_id.soo_function_generator <- function(fn)
  attr(fn, "id")
