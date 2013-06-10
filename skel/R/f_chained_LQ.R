##' Chained LQ test function generator.
##'
##' The chained LQ test function is defined as
##'
##'   \deqn{f(x) = \sum_{i=1}^{n-1} \max\left\{-x_i - x_{i+1}, -x_i - x_{i+1} + (x_i^2 + x_{i+1}^2 - 1)\right\}}
##'
##' @param dimensions [\code{integer(1)}] Size of parameter space.
##' @return A \code{soo_function}.
##' 
##' @references Haarala, M. and Miettinen, K. and Maekelae, M. M., New limited
##' memory bundle method for large-scale nonsmooth optimization.
##'
##' @export
generate_chained_LQ_function <- function(dimensions)
  soo_function(name="Chained_LQ",
               id=sprintf("chained-LQ-%id", dimensions),
               fun=f_chained_LQ,
               dimensions=dimensions,
               lower_bounds=rep(-Inf, dimensions),
               upper_bounds=rep(Inf, dimensions),
               #FIXME: best params unknown
               best_par=rep(0, dimensions),
               best_value=-(dimensions - 1)*sqrt(2))
  
class(generate_chained_LQ_function) <- "soo_function_generator"
attr(generate_chained_LQ_function, "id") <- "chained_LQ"
attr(generate_chained_LQ_function, "name") <- "Chained LQ test function"

f_chained_LQ = function(x, ...) {
	n = length(x)
	res = 0
	for (i in 1:(n-1)) {
		res = res + max(-x[i] - x[i+1], -x[i] - x[i+1] + (x[i]^2 + x[i+1]^2 - 1))
	}
	res
}