##' Return a new function which is identical to the \code{soofunction}
##' passed in except that the num all visited target values are recorded.
##' 
##' @param fn A test function (class \code{soo_function}).
##'
##' @examples
##' f <- record_target_values_function(generate_sphere_function(1))
##' target_values(f)
##' sapply(c(2,3,1), f)
##' y <- target_values(f)
##' print(y)
##' first_hitting_times(y, c(1, 7))
##' reset_target_values(f)
##' target_values(f)
##'
##' @seealso \code{\link{target_values}},
##'          \code{\link{reset_target_values}},
##'          \code{\link{first_hitting_times}}
##' @export
record_target_values_function <- function(fn) {
  force(fn)
  stopifnot("soo_function" %in% class(fn))
  if ("record_target_values_function" %in% class(fn))
    stop("Function already is of type 'record_target_values_function'.")

  target_values <- numeric(1000L)
  i <- 0L
  
  cfun <- function(x, ...) {
    y <- fn(x, ...)
    m <- length(y)
    n <- length(target_values)
    if ((i + m) > n) {
      n <- max(2 * n, i + m)
      target_values[(i+1):n] <- 0
    }
    target_values[(i+1):(i+m)] <<- y
    i <<- i + m
    y
  }
  attributes(cfun) <- attributes(fn)
  class(cfun) <- c("record_target_values_function", class(fn))
  cfun
}

##' Return the internally recorded target values for a test function.
##'
##' @param fn A function whos target values should be returned.
##' 
##' @return The currently recorded target values.
##' @export
target_values <- function(fn)
  UseMethod("target_values")

##' @S3method target_values record_target_values_function
##' @method target_values record_target_values_function
target_values.record_target_values_function <- function(fn) {
  ee <- environment(fn)
  ee$target_values[1:ee$i]
}

##' Reset the internal target values of a test function.
##' 
##' @param fn Function whos target value recordings should be reset.
##'
##' @return Recorded target values before reset.
##' @export
reset_target_values <- function(fn) {
  stopifnot("record_target_values_function" %in% class(fn))
  ee <- environment(fn)
  last <- ee$target_values
  ## OME: Reset counter!
  ee$i <- 0L
  ee$target_values <- numeric(0L)
  last
}
