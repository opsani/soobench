##' Chained CB3 II test function generator.
##'
##' The chained CB3 II test function is defined as
##'
##'   \deqn{f(x) = \max\left\{\sum_{i=1}^{n-1} \left(x_i^4 + x_{i+1}^2\right), \sum_{i=1}^{n-1} \left((2-x_i)^2 + (2-x_{i+1})^2\right), \sum_{i=1}^{n-1} \left(2e^{-x_i + x_{i+1}}\right)\right\}}
##'
##' @param dimensions [\code{integer(1)}] Size of parameter space.
##' @return A \code{soo_function}.
##'
##' @references Haarala, M. and Miettinen, K. and Maekelae, M. M., New limited
##' memory bundle method for large-scale nonsmooth optimization.
##'
##' @export
generate_chained_CB3_II_function <- function(dimensions)
  soo_function(name="Chained_CB3_II",
               id=sprintf("chained-CB3-II-%id", dimensions),
               fun=f_chained_CB3_II,
               dimensions=dimensions,
               lower_bounds=rep(-Inf, dimensions),
               upper_bounds=rep(Inf, dimensions),
               best_par=rep(0, dimensions),
               best_value=2*(dimensions - 1))
  
class(generate_chained_CB3_II_function) <- "soo_function_generator"
attr(generate_chained_CB3_II_function, "id") <- "chained_CB3_II"
attr(generate_chained_CB3_II_function, "name") <- "Chained CB3 II test function"

f_chained_CB3_II <- function(x, ...) {
	res = numeric(3)
	for (i in 1:(length(x)-1)) {
		res[1] = res[1] + (x[i]^4 + x[i+1]^2)
		res[2] = res[2] + ((2-x[i])^2 + (2-x[i+1])^2)
		res[3] = res[3] + 2 * exp(-x[i] + x[i+1])
	}
	max(res)
}