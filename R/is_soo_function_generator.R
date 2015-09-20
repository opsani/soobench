#' SOO function generator
#' 
#' Returns wether \code{fn} is a generator for a single objective
#' optimization function.
#'
#' @param fn Function.
#' @return \code{TRUE} if \code{fn} is a function generator and
#'   \code{FALSE} otherwise.
#' @export
is_soo_function_generator <- function(fn)
  inherits(fn, "soo_function_generator")
