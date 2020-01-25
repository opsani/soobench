#' Recording functions
#'
#' Return a new function which is identical to the \code{soofunction}
#' passed in except that evaluated parameter settings and function
#' values are recorded.
#'
#' @param fn A test function (class \code{soo_function} or
#' \code{wrapped_soo_function}).
#'
#' @param record_pars [\code{boolean(1)}]\cr If \code{TRUE}, parameter
#'   values (x) will be recorded.
#'
#' @param record_values [\code{boolean(1)}]\cr If \code{TRUE}, function
#'   values (y) will be recorded.
#'
#' @param predicate [\code{function(par, value, time)}]\cr Predicate
#'   function that returns \code{TRUE} if recording should take place
#'   for the given parameter setting \code{par}, function value
#'   \code{value} and evaluation \code{time}. Note that \code{time} is
#'   measured in function evaluations.
#'
#' @seealso \code{\link{recorded_values}} to retrieve the recorded
#' parameter and function values.
#'
#' @examples
#' fn <- recording_function(generate_sphere_function(2))
#' X <- random_parameters(10, fn)
#' y <- fn(X)
#' rv <- recorded_values(fn)
#' all.equal(rv$par, X)
#' all.equal(rv$value, y)
#'
#' ## With a predicate
#' pv <- function(par, value, time)
#'   time %% 3 == 0
#' fn <- recording_function(generate_sphere_function(2), predicate=pv)
#' X <- random_parameters(10, fn)
#' y <- fn(X)
#' rv <- recorded_values(fn)
#' all(rv$time %% 3 == 0)
#' all.equal(rv$par, X[, rv$time])
#' all.equal(rv$value, y[rv$time])
#'
#' @export
recording_function <- function(fn,
                               record_pars=TRUE,
                               record_values=TRUE,
                               predicate) {
  force(fn)
  force(record_pars)
  force(record_values)
  if (!record_values && !record_pars)
    stop("At least one of 'record_pars' and 'record_values' should be TRUE.")

  ## If no predicate is given, record _all_ evaluations.
  if (missing(predicate))
    predicate <- function(...) TRUE

  stopifnot(is_soo_function(fn))
  if (is_recording_function(fn))
    stop("Function already is of type 'recording_function'.")

  times <- numeric(0L)
  pars <- matrix(0, nrow=number_of_parameters(fn), ncol=0)
  values <- numeric(0L)
  current_position <- 0L
  current_time <- 0L
  cfun <- function(x, ...) {
    ## Make sure 'x' is a matrix:
    if (!is.matrix(x))
      dim(x) <- c(length(x), 1)

    y <- fn(x, ...)

    for (i in 1:ncol(x)) {
      current_par <- x[, i]
      current_value <- y[i]
      current_time <<- current_time + 1L
      if (predicate(current_par, current_value, current_time)) {
        current_position <<- current_position + 1L
        times[current_position] <<- current_time
        if (record_pars)
          pars <<- cbind(pars, current_par, deparse.level=0)
        if (record_values)
          values[current_position] <<- current_value
      }
    }
    y
  }
  class(cfun) <- c("recording_function", "wrapped_soo_function")
  cfun
}

#' Return the internally recorded parameter settings and function
#' values for a test function.
#'
#' @param fn A function with recorded parameter settings and function
#' values that should be returned.
#'
#' @return A list with elements \code{time}, \code{par} and
#' \code{value} which are the point in time (in number of function
#' evaluations), the parameter setting and the function value
#' recorded. The parameter settings are stored in a matrix where each
#' column is one parameter settings.
#'
#' @export
recorded_values <- function(fn)
  UseMethod("recorded_values")

#' @export
#' @method recorded_values recording_function
recorded_values.recording_function <- function(fn) {
  ee <- environment(fn)
  list(time=ee$times,
       par=ee$pars,
       value=ee$values)
}

#' @export
#' @method recorded_values wrapped_soo_function
recorded_values.wrapped_soo_function <- function(fn) {
  recorded_values(inner_function(fn))
}

#' Recording function
#'
#' Check if a function supports the \sQuote{recording_function} interface.
#'
#' @param fn Function to check.
#'
#' @return \code{TRUE} if \code{fn} is a \sQuote{recording_function}
#' else \code{FALSE}.
#'
#' @export
is_recording_function <- function(fn)
  UseMethod("is_recording_function")

#' @export
#' @method is_recording_function wrapped_soo_function
is_recording_function.wrapped_soo_function <- function(fn)
  is_recording_function(inner_function(fn))

#' @export
#' @method is_recording_function recording_function
is_recording_function.recording_function <- function(fn)
  TRUE

#' @export
#' @method is_recording_function soo_function
is_recording_function.soo_function <- function(fn)
  FALSE

#' @export
#' @method inner_function recording_function
inner_function.recording_function <- function(fn) {
  ee <- environment(fn)
  ee$fn
}
