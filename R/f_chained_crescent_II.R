#' Chained Crescent II function generator.
#'
#' The chained Crescent II function is defined as
#'
#'   \deqn{f(x) = \sum_{i=1}^{n-1} \max\left\{x_i^2 +(x_{i+1}^2 -1)^2 + x_{i+1} - 1), -x_i^2 - (x_{i+1}^2 -1)^2 + x_{i+1} 1 1\right\}}
#' 
#' @param dimensions [\code{integer(1)}] Size of parameter space.
#' @return A \code{soo_function}.
#'
#' @references Haarala, M. and Miettinen, K. and Maekelae, M. M., New limited
#' memory bundle method for large-scale nonsmooth optimization.
#'
#' @export
generate_chained_crescent_II_function <- function(dimensions)
  soo_function(name="Chained Crescent II",
               id=sprintf("chained-crescent-II-%id", dimensions),
               fun=f_chained_crescent_II,
               dimensions=dimensions,
               lower_bounds=rep(-Inf, dimensions),
               upper_bounds=rep(Inf, dimensions),
               #FIXME: best params unknown
               best_par=rep(0, dimensions),
               best_value=0)
  
class(generate_chained_crescent_II_function) <- c("soo_function_generator", "function")
attr(generate_chained_crescent_II_function, "id") <- "chained_crescent_II"
attr(generate_chained_crescent_II_function, "name") <- "Chained Crescent II test function"

f_chained_crescent_II <- function(x, ...) {
  n = length(x)
	res = 0
  for (i in 1:(n-1)) {
    res = res + max(x[i]^2+(x[i+1]-1)^2+x[i+1]-1, -x[i]^2-(x[i+1]-1)^2+x[i+1]+1)

  }
  res
}