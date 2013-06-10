##' Generalized MXHILB test function generator.
##'
##' The generalized MXHILB test function is defined as
##'
##'   \deqn{f(x) = \max_{1 \leq i \neq n} \left| \sum_{j=1}^{n} \frac{x_j}{i+j-1}\right|}
##'
##' @param dimensions [\code{integer(1)}] Size of parameter space.
##' @return A \code{soo_function}.
##' 
##' @references Haarala, M. and Miettinen, K. and Maekelae, M. M., New limited
##' memory bundle method for large-scale nonsmooth optimization.
##'
##' @export
generate_generalized_MXHILB_function <- function(dimensions)
  soo_function(name="Generalized MXHILB",
               id=sprintf("generalized-MXHILB-%id", dimensions),
               fun=f_generalized_MAXHLIB,
               dimensions=dimensions,
               lower_bounds=rep(-Inf, dimensions),
               upper_bounds=rep(Inf, dimensions),
               #FIXME: best params unknown
               best_par=rep(0, dimensions),
               best_value=0)
  
class(generate_generalized_MXHILB_function) <- "soo_function_generator"
attr(generate_generalized_MXHILB_function, "id") <- "generalized_MXHILB"
attr(generate_generalized_MXHILB_function, "name") <- "Generalized MXHILB test function"

f_generalized_MAXHLIB = function(x, ...) {
	n = length(x)
	res = numeric(n)
	for (i in 1:n) {
		res[i] = 0
		for (j in 1:n) {
			res[i] = res[i] + (x[j] / (i+j-1))
		}
	}
	max(res)
}