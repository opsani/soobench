##' Return a new function which is identical to the \code{soofunction}
##' passed in except that all visited target values are recorded.
##' 
##' @param fun A test function (class \code{soo_function}).
##'
##' @examples
##' f <- record_target_values_function(generate_sphere_function(1))
##' target_values(f)
##' sapply(c(2,3,1), f)
##' y <- target_values(f)
##' first_hitting_times(y, c(1, 7))
##' reset_target_values(f)
##' target_values(f)
##'
##' @seealso \code{\link{target_values}},
##'          \code{\link{reset_target_values}},
##'          \code{\link{first_hitting_times}}
##' @export
record_target_values_function <- function(fun) {            
  force(fun)
  stopifnot("soo_function" %in% class(fun))
  if ("record_target_values_function" %in% class(fun))
    stop("Function already is of type 'record_target_values_function'.")

  target_values <- numeric(1000L)
  i <- 0L
  
  cfun <- function(x, ...) {
    y <- fun(x, ...)
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
  attributes(cfun) <- attributes(fun)
  class(cfun) <- c("record_target_values_function", class(fun))
  cfun
}

##' Return the internally recorded target values for a test function.
##'
##' @param fun A \code{record_target_values_function} as returned by
##'   \code{\link{record_target_values_function}}.
##' 
##' @return The currently recorded target values.
##' @export
target_values <- function(fun) {
  stopifnot("record_target_values_function" %in% class(fun))
  ee <- environment(fun)
  ee$target_values[1:ee$i]
}

##' Reset the internal target values of a test function.
##' 
##' @param fun A \code{record_target_values_function} as returned by
##'   \code{\link{record_target_values_function}}.
##'
##' @return Recorded target values before reset.
##' @export
reset_target_values <- function(fun) {
  stopifnot("record_target_values_function" %in% class(fun))
  ee <- environment(fun)
  last <- ee$target_values
  ## OME: Reset counter!
  ee$i <- 0L
  ee$target_values <- numeric(0L)
  last
}

##' Return numerical vector of first hitting times, counted in 
##' function evaluations.
##' 
##' @param x Numerical vector of recorded target values or
##'   a function of class \code{record_target_values_function}.
##' @param target_levels Numerical vector of target levels which should
##'   ideally be reached.
##'
##' @seealso \code{\link{record_target_values_function}}
##' @export
first_hitting_times <- function(x, target_levels) {
  if (inherits(x, "record_target_values_function"))
    x <- target_values(x)
  stopifnot(is.numeric(x), is.vector(x))    
  sapply(target_levels, function(level) which(x <= level)[1L])
}
