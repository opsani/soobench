##' Schwefel test function generator.
##'
##' The Schwefel function is one of the classic test functions in the EA literature. It is defined as
##'
##'   \deqn{f(x) = 418.9829n - sum(-x * sin(sqrt(abs(x))).}
##'
##' Here \eqn{n} denotes the length of the parameter vector \eqn{x}.
##' 
##' @param dimensions Size of parameter space.
##' @return A \code{soo_function}.
##' @export
##' @useDynLib soobench do_f_schwefel
schwefel_function <- function(dimensions)
  soo_function(name="Schwefel",
               id=sprintf("schwefel-%id", dimensions),
               fun=function(x, ...) .Call(do_f_schwefel, x),
               dimensions=dimensions,
               lower_bounds=rep(-500, dimensions),
               upper_bounds=rep(500, dimensions),
               best_par=rep(-420.9687, dimensions),
               best_value=0)
