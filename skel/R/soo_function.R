##' Define a new \code{soo_function} object.
##'
##' @param name Name of function.
##' @param id Short id for the function. Must be unique to the
##'   function instance and should not contain any other characters than
##'   [a-z], [0-9] and \sQuote{-}.
##' @param fun Function definition.
##' @param dimensions Size of parameter space.
##' @param lower_bounds Lower bounds of the parameter space.
##' @param upper_bounds Upper bounds of the parameter space.
##' @param best_value Best known function value.
##' @param best_par Parameter settings that correspond to
##'   \code{best_value}. If there are multiple global minima, this
##'   should be a list with one entry for each minimum.
##' @return A \code{soo_function} object.
##'
##' @examples
##' ## Given the following simple benchmark function:
##' f_my_sphere <- function(x)
##'   sum((x-1)*(x-1))
##'
##' ## we can define a corresponding 2d soo_function:
##' f <- soo_function("My Sphere", "my-sphere-2d", f_my_sphere, 2,
##'                   c(-10, -10), c(10, 10),
##'                   0, c(1, 1))
##'
##' ## And then plot it:
##' plot(f)
##' 
##' @export
soo_function <- function(name, id, fun, dimensions,
                         lower_bounds, upper_bounds,
                         best_value, best_par) {
  stopifnot(as.integer(dimensions) == dimensions,
            length(dimensions) == 1,
            length(lower_bounds) == length(upper_bounds),
            length(lower_bounds) == dimensions,
            length(best_value) == 1,
            is.character(name),
            is.character(id),
            length(name) == 1,
            length(id) == 1)
  if(is.null(grep("^[:alpha:]+[[:alnum:]_-]*$", id, value=TRUE)))
    warning("Function Id should start with letter and contain only characters from the set [A-Za-z0-9_-]")
  
  structure(fun, name=name, id=id, dimensions=dimensions,
            class=c("soo_function", class(fun)),
            lower_bounds=lower_bounds,
            upper_bounds=upper_bounds,
            best_par=best_par, best_value=best_value)
}

##' Check if a function is a SOO function.
##'
##' @param fn Function to check.
##' @return \code{TRUE} if \code{fn} is a proper SOO function, else \code{FALSE}.
##' @export
is_soo_function <- function(fn)
  inherits(fn, "soo_function")
