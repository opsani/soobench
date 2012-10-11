##' Return a new function which is identical to the \code{soofunction}
##' passed in except that all visited target vales are recorded.
##' 
##' @param fun A test function (class \code{soo_function}).
##'
##' @examples
##' f <- soobench:::record_target_values_function(generate_sphere_function(1))
##' soobench:::target_values(f)
##' sapply(c(2,3,1), f)
##' y <- soobench:::target_values(f)
##' soobench:::first_hitting_times(y, c(1, 7))
##' soobench:::reset_target_values(f)
##' soobench:::target_values(f)
##'
##' @seealso \code{\link{target_values}},
##'          \code{\link{reset_target_values}},
##'          \code{\link{first_hitting_times}}
record_target_values_function <- function(fun) {            
  force(fun)
  stopifnot("soo_function" %in% class(fun))
  if ("record_target_values_function" %in% class(fun))
    stop("Function already is of type 'record_target_values_function'.")
    
  target_values <- numeric(0L)
  
  cfun <- function(x, ...) {
    y <- fun(x, ...)
    target_values <<- c(target_values, y)
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
target_values <- function(fun) {
  stopifnot("record_target_values_function" %in% class(fun))
  environment(fun)$target_values
}

##' Reset the internal target values of a test function.
##' 
##' @param fun A \code{record_target_values_function} as returned by
##'   \code{\link{record_target_values_function}}.
##'
##' @return Recorded target values before reset.
reset_target_values <- function(fun) {
  stopifnot("record_target_values_function" %in% class(fun))
  ee <- environment(fun)
  last <- ee$target_values
  ee$target_values <- numeric(0L)
  last
}

##' Return numerical vector of first hitting times, counted in 
##' function evaluations.
##' 
##' @param target_values Numerical vector of recorded target values.
##' @param target_levels Numerical vector of target levels which should
##'   ideally be reached.
first_hitting_times <- function(target_values, target_levels) {
  sapply(target_levels, function(lev) which(target_values <= lev)[1L])
}
