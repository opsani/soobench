##' Return numerical vector of first hitting times, counted in 
##' function evaluations.
##' 
##' @param x Object from which the reached target values are to be
##'   extracted. Methods for numeric vectors and
##'   \code{record_target_values_function} class objects are provided.
##' @param target_levels Numerical vector of target levels which should
##'   ideally be reached.
##'
##' @seealso \code{\link{recording_function}}
##' @export
first_hitting_times <- function(x, target_levels) {
  UseMethod("first_hitting_times")
}

##' @S3method first_hitting_times numeric
##' @method first_hitting_times numeric
first_hitting_times.numeric <- function(x, target_levels) {
  sapply(target_levels, function(level) which(x <= level)[1L])
}

##' @S3method first_hitting_times recording_function
##' @method first_hitting_times recording_function
first_hitting_times.recording_function <- function(x, target_levels) {
  rv <- recorded_values(x)
  if (is.null(rv$value))
    stop("No target values recorded by test function.")

  ## Did we not record any evaluations?
  if (max(rv$time) != length(rv$time))
    warning("Not all evaluations were recorded. Returned first hitting times could be inaccurate.")

  value <- rep(Inf, max(rv$time))
  value[rv$time] <- rv$value
  first_hitting_times(value, target_levels)
}
