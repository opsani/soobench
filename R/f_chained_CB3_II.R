#' Chained CB3 II test function generator.
#'
#' The chained CB3 II test function is defined as
#'
#'   \deqn{f(x) = \max\left\{\sum_{i=1}^{n-1} \left(x_i^4 + x_{i+1}^2\right), \sum_{i=1}^{n-1} \left((2-x_i)^2 + (2-x_{i+1})^2\right), \sum_{i=1}^{n-1} \left(2e^{-x_i + x_{i+1}}\right)\right\}}
#'
#' @param dimensions [\code{integer(1)}] Size of parameter space.
#' @return A \code{soo_function}.
#'
#' @references Haarala, M. and Miettinen, K. and Maekelae, M. M., New limited
#' memory bundle method for large-scale nonsmooth optimization.
#'
#' @export
#' @useDynLib soobench do_f_chained_cb3_ii
generate_chained_cb3_ii_function <- function(dimensions)
  soo_function(name="Chained_cb3_ii",
               id=sprintf("chained-cb3-ii-%id", dimensions),
               fun=function(x, ...) .Call(do_f_chained_cb3_ii, x),
               dimensions=dimensions,
               lower_bounds=rep(-10, dimensions),
               upper_bounds=rep(10, dimensions),
               best_par=rep(1, dimensions),
               best_value=2*(dimensions - 1))
  
class(generate_chained_cb3_ii_function) <- "soo_function_generator"
attr(generate_chained_cb3_ii_function, "id") <- "chained_cb3_ii"
attr(generate_chained_cb3_ii_function, "name") <- "Chained CB3 II test function"
