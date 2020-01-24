#' Generalized MAXQ test function generator.
#'
#' The generalized MAXW test function is defined as
#'
#'   \deqn{f(x) = \max_{1 \leq i \neq n} x_i^2}
#'
#' @references Haarala, M. and Miettinen, K. and Maelelae, M. M., New limited
#' memory bundle method for large-scale nonsmooth optimization.
#'
#' @param dimensions [\code{integer(1)}] Size of parameter space.
#' @return A \code{soo_function}.
#' @export
#' @useDynLib soobench do_f_generalized_maxq
generate_generalized_maxq_function <- function(dimensions)
  soo_function(name="Generalized MAXQ",
               id=sprintf("generalized-maxq-%id", dimensions),
               fun=function(x, ...) .Call(do_f_generalized_maxq, x),
               dimensions=dimensions,
               lower_bounds=rep(-10, dimensions),
               upper_bounds=rep(10, dimensions),
               best_par=rep(0, dimensions),
               best_value=0)

class(generate_generalized_maxq_function) <- c("soo_function_generator", "function")
attr(generate_generalized_maxq_function, "id") <- "generalized_maxq"
attr(generate_generalized_maxq_function, "name") <- "Generalized MAXQ test function"
