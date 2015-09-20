#' Double sum test function generator.
#'
#' The definition used is
#'
#'   \deqn{f(x) = \sum_{i=1}^n \left( \sum_{j=1}^{i} x_j \right)^2}
#'
#' @param dimensions [\code{integer(1)}] Size of parameter space.
#' @return A \code{soo_function}.
#' 
#' @references H.-P. Schwefel. Evolution and Optimum Seeking. 
#' John Wiley & Sons, New York, 1995.
#' 
#' @export
#' @useDynLib soobench do_f_double_sum
generate_double_sum_function <- function(dimensions)
  soo_function(name="Double sum",
               id=sprintf("double-sum-%id", dimensions),
               fun=function(x, ...) .Call(do_f_double_sum, x),
               dimensions=dimensions,
               lower_bounds=rep(-65.536, dimensions),
               upper_bounds=rep(65.536, dimensions),
               best_par=rep(0, dimensions),
               best_value=0)
               
               
class(generate_double_sum_function) <- c("soo_function_generator", "function")
attr(generate_double_sum_function, "id") <- "double-sum"
attr(generate_double_sum_function, "name") <- "Double sum test function"
