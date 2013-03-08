##' Return numerical vector of first hitting times, counted in 
##' function evaluations.
##' 
##' @param x Object from which the reached target values are to be
##'   extracted. Methods for numeric vectors and
##'   \code{record_target_values_function} class objects are provided.
##' @param target_levels Numerical vector of target levels which should
##'   ideally be reached.
##'
##' @seealso \code{\link{record_target_values_function}}
##' @export
first_hitting_times <- function(x, target_levels) {
  UseMethod("first_hitting_times")
}

##' @S3method first_hitting_times numeric
##' @method first_hitting_times numeric
first_hitting_times.numeric <- function(x, target_levels) {
  sapply(target_levels, function(level) which(x <= level)[1L])
}

##' @S3method first_hitting_times record_target_values_function
##' @method first_hitting_times record_target_values_function
first_hitting_times.record_target_values_function <- function(x, target_levels) {
  tv <- target_values(x)
  first_hitting_times(tv, target_levels)
}
