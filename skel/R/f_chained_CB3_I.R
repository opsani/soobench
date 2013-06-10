##' Chained CB3 I test function generator.
##'
##' The chained CB3 I test function is defined as
##'
##'   \deqn{f(x) = \sum_{i=1}^{n-1} \max\left\{x_i^4 + x_{i+1}^2, (2-x_i)^2 + (2-x_{i+1})^2, 2e^{-x_i + x_{i+1}}\right\}}
##'
##' @param dimensions [\code{integer(1)}] Size of parameter space.
##' @return A \code{soo_function}.
##'
##' @references Haarala, M. and Miettinen, K. and Maekelae, M. M., New limited
##' memory bundle method for large-scale nonsmooth optimization.
##'
##' @export
generate_chained_CB3_I_function <- function(dimensions)
  soo_function(name="Chained_CB3_I",
               id=sprintf("chained-CB3-I-%id", dimensions),
               fun=f_chained_CB3_I,
               dimensions=dimensions,
               lower_bounds=rep(-Inf, dimensions),
               upper_bounds=rep(Inf, dimensions),
               #FIXME: best params unknown
               best_par=rep(0, dimensions),
               best_value=2*(dimensions - 1))
  
class(generate_chained_CB3_I_function) <- "soo_function_generator"
attr(generate_chained_CB3_I_function, "id") <- "chained_CB3_I"
attr(generate_chained_CB3_I_function, "name") <- "Chained CB3 I test function"

f_chained_CB3_I <- function(x, ...) {
	n = length(x)
	res = 0
	for (i in 1:(n-1)) {
		res = res + max(x[i]^4 + x[i+1]^2, (2-x[i])^2 + (2-x[i+1])^2, 2*exp(-x[i] + x[i+1]))
	}
	res
}