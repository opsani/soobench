##' Count number of function evaluations
##' 
##' Return a new function which is identical to the \code{soofunction}
##' passed in except that all function evaluations are counted.
##'
##' @param fn [\code{soo_function}]\cr A test function.
##'
##' @examples
##' f <- counting_function(generate_double_sum_function(5))
##' number_of_evaluations(f)
##'
##' y <- f(random_parameters(1, f))
##' number_of_evaluations(f)
##' 
##' reset_evaluation_counter(f)
##' number_of_evaluations(f)
##' 
##' y <- f(random_parameters(21, f))
##' number_of_evaluations(f)
##'
##' @seealso \code{\link{number_of_evaluations}},
##'          \code{\link{reset_evaluation_counter}}
##' @export
counting_function <- function(fn) {            
  force(fn)
  stopifnot(is_soo_function(fn))
  if (is_counting_function(fn))
    stop("Function already is of type 'counting_function'.")

  count <- 0L
  structure(function(x, ...) {
    count <<- count + if (is.matrix(x)) ncol(x) else 1L
    fn(x, ...)
  }, class=c("counting_function", "wrapped_soo_function"))
}

##' Retrieve evaluation counter
##' 
##' Return the number of times a test function has been evaluated.
##'
##' The test function must be wrapped by
##' \code{\link{counting_function}} for this to work.
##' 
##' @param fn [\code{counting_function}]\cr A counting function  as
##' returned by \code{\link{counting_function}}.
##' 
##' @return The current value of the evaluation counter.
##'
##' @export
number_of_evaluations <- function(fn)
  UseMethod("number_of_evaluations")

##' @S3method number_of_evaluations counting_function
number_of_evaluations.counting_function <- function(fn)
  environment(fn)$count

##' @S3method number_of_evaluations wrapped_soo_function
number_of_evaluations.wrapped_soo_function <- function(fn)
  number_of_evaluations(inner_function(fn))


##' Reset evaluation counter
##' 
##' Reset the evaluation counter of a test function.
##'
##' The test function must be wrapped by
##' \code{\link{counting_function}} for this to work.
##' 
##' @param fn [\code{counting_function}]\cr A counting function as
##' returned by \code{\link{counting_function}}.
##'
##' @return The current value of the evaluation counter.
##' 
##' @export
reset_evaluation_counter <- function(fn)
  UseMethod("reset_evaluation_counter")

##' @S3method reset_evaluation_counter counting_function
reset_evaluation_counter.counting_function <- function(fn) {
  last_count <- environment(fn)$count
  environment(fn)$count <- 0L
  last_count
}

##' @S3meothd reset_evaluation_counter wrapped_soo_function
reset_evaluation_counter.wrapped_soo_function <- function(fn)
  reset_evaluation_counter(inner_function(fn))

##' Counting function
##'
##' Check if a function or one of its wrapped functions is a
##' \sQuote{counting_function}.
##'
##' @param fn [\code{function}] Function to check.
##'
##' @export
is_counting_function <- function(fn)
  UseMethod("is_counting_function")

##' @S3method is_counting_function counting_function
is_counting_function.counting_function <- function(fn)
  TRUE

##' @S3method is_counting_function soo_function
is_counting_function.soo_function <- function(fn)
  FALSE

##' @S3method is_counting_function wrapped_soo_function
is_counting_function.wrapped_soo_function <- function(fn)
  is_counting_function(inner_function(fn))

##' @S3method inner_function counting_function
inner_function.counting_function <- function(fn)
  environment(fn)$fn
