##' A box-constrained single objective optimization problem.
##'
##' @param fn Function to be minimized.
##' @param lower Lower bounds on parameter space of function.
##' @param upper Upper bounds on parameter space of function.
##'
##' @return A list containing the following entries. \code{fn} the
##'   function to be minimized, \code{lower} vector of lower bounds,
##'   \code{upper} vector of upper bounds.
##' @export
box_constrained_problem <- function(fn, lower, upper) {
  stopifnot(is.function(fn),
            is.vector(lower), is.numeric(lower), all(is.finite(lower)),
            is.vector(upper), is.numeric(upper), all(is.finite(upper)),
            length(lower) == length(upper))
  structure(list(fn=fn, lower=lower, upper=upper),
            class="box_constrained_problem")
}
