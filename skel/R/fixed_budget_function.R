##' Return a new function which is identical to the \code{soofunction}
##' passed in except that all visited target values are recorded.
##' 
##' @param fun A test function (class \code{soo_function}).
##' @param n Maximal number of function evaluations.
##'
##' @examples
##' library("soobench")
##' 
##' fn <- generate_rosenbrock_function(2)
##' fn <- fixed_budget_function(fn, 100)
##' fn <- record_target_values_function(fn)
##' 
##' par <- random_parameter(fn)
##' r <- tryCatch(optim(par, fn), method="BFGS",
##'               ## Ignore 'evaluation_limit_error's
##'               evaluation_limit_error=function(cond) NULL,
##'               error=function(cond) cond)
##' first_hitting_times(fn, 10^(5:(-8)))
##' @export
fixed_budget_function <- function(fun, n) {
  force(fun)
  stopifnot("soo_function" %in% class(fun))
  if ("fixed_budget_function" %in% class(fun))
    warning("Probably not a good idea to nest fixed_budget_functions.")

  count <- 0
  nfun <- function(x, ...) {
    count <<- count + 1
    if (count > n) {
      ## Call stop() with a custom error so that it is easier to catch
      ## and handle in the presence of other "real" error. See
      ## Examples section of manual page for an example.      
      err <- simpleError("Evaluation limit reached.")
      class(err) <- c("evaluation_limit_error", "condition")
      ## Do not capture (possibly huge) call stack => call. = FALSE
      signalCondition(err)
    }
    fun(x, ...)
  }
  ## Copy attributes of parent function
  attributes(nfun) <- attributes(fun)
  class(nfun) <- c("fixed_budget_function", class(fun))
  nfun
}
