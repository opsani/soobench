##' Discus test function generator.
##'
##' The discus test function is similar to a high condition ellipsoid. It is defined as
##'
##'   \deqn{f(x) = 10^6 x_1^2 + \sum_{i=2}^n x_i^2}
##' 
##' @param dimensions Size of parameter space.
##' @return A \code{soo_function}.
##' @export
generate_discus_function <- function(dimensions)
  soo_function(name="Discus",
               id=sprintf("discus-%id", dimensions),
               fun=function(x, ...) 1e6 * x[1]^2 + sum(x[-1]*x[-1]),
               dimensions=dimensions,
               lower_bounds=rep(-32.768, dimensions),
               upper_bounds=rep(32.768, dimensions),
               best_par=rep(0, dimensions),
               best_value=0)

               
class(generate_discus_function) <- "soo_function_generator"
attr(generate_discus_function, "id") <- "discus"
attr(generate_discus_function, "name") <- "Discus test function"

