#' Chained Mifflin 2 function generator.
#'
#' The chained Mifflin function 2 is defined as
#'
#'   \deqn{f(x) = \sum_{i=1}^{n-1} \left(-x_i + 2(x_i^2 + x_{i+1}^2 - 1) + 1.75|x_i^2 + x_{i+1}^2 - 1|\right)}
#'
#' @param dimensions [\code{integer(1)}] Size of parameter space.
#' @return A \code{soo_function}.
#'
#' @references Haarala, M. and Miettinen, K. and Maekelae, M. M., New limited
#' memory bundle method for large-scale nonsmooth optimization.
#'
#' @export
generate_chained_mifflin_function <- function(dimensions)
  soo_function(name="Chained Mifflin 2",
               id=sprintf("chained-mifflin-2-%id", dimensions),
               fun=f_chained_mifflin_2,
               dimensions=dimensions,
               lower_bounds=rep(-Inf, dimensions),
               upper_bounds=rep(Inf, dimensions),
               #FIXME: best params unknown
               best_par=rep(0, dimensions),
               best_value=0)

class(generate_chained_mifflin_function) <- c("soo_function_generator", "function")
attr(generate_chained_mifflin_function, "id") <- "chained_mifflin_2"
attr(generate_chained_mifflin_function, "name") <- "Chained Mifflin 2 test function"

f_chained_mifflin_2 <- function(x, ...) {
  n = length(x)
	res = 0
  xsq = x^2
  for (i in 1:(n-1)) {
    res = res -x[i] + 2*(xsq[i] + xsq[i+1] - 1) + 1.75*abs(xsq[i] + xsq[i+1] - 1)
  }
  res
}
