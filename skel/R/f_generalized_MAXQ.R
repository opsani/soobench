##' Generalized MAXQ test function generator.
##'
##' The generalized MAXW test function is defined as
##'
##'   \deqn{f(x) = \max_{1 \leq i \neq n} x_i^2}
##' 
##' @references Haarala, M. and Miettinen, K. and Maelelae, M. M., New limited
##' memory bundle method for large-scale nonsmooth optimization.
##'
##' @param dimensions [\code{integer(1)}] Size of parameter space.
##' @return A \code{soo_function}.
##' @export
generate_generalized_MAXQ_function <- function(dimensions)
  soo_function(name="Generalized MAXQ",
               id=sprintf("generalized-MAXQ-%id", dimensions),
               fun=function(x, ...) max(x^2),
               dimensions=dimensions,
               lower_bounds=rep(-Inf, dimensions),
               upper_bounds=rep(Inf, dimensions),
               #FIXME: best params unknown
               best_par=rep(0, dimensions), 
               best_value=0)
  
class(generate_generalized_MAXQ_function) <- "soo_function_generator"
attr(generate_generalized_MAXQ_function, "id") <- "generalized_MAXQ"
attr(generate_generalized_MAXQ_function, "name") <- "Generalized MAXQ test function"