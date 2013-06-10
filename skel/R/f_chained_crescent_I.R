##' Chained Crescent I function generator.
##'
##' The chained Crescent I function is defined as
##'
##'   \deqn{f(x) = \max\left\{\sum_{i=1}^{n-1} \left(x_i^2 +(x_{i+1}^2 -1)^2 + x_{i+1} - 1\right), \sum_{i=1}^{n-1} \left(-x_i^2 - (x_{i+1}^2 -1)^2 + x_{i+1} 1 1\right)\right\}}
##' 
##' @param dimensions [\code{integer(1)}] Size of parameter space.
##' @return A \code{soo_function}.
##'
##' @references Haarala, M. and Miettinen, K. and Maekelae, M. M., New limited
##' memory bundle method for large-scale nonsmooth optimization.
##'
##' @export
generate_chained_crescent_I_function <- function(dimensions)
  soo_function(name="Chained Crescent I",
               id=sprintf("chained-crescent-I-%id", dimensions),
               fun=f_chained_crescent_I,
               dimensions=dimensions,
               lower_bounds=rep(-Inf, dimensions),
               upper_bounds=rep(Inf, dimensions),
               #FIXME: best params unknown
               best_par=rep(0, dimensions),
               best_value=0)
  
class(generate_chained_crescent_I_function) <- "soo_function_generator"
attr(generate_chained_crescent_I_function, "id") <- "chained_crescent_I"
attr(generate_chained_crescent_I_function, "name") <- "Chained Crescent I test function"

f_chained_crescent_I <- function(x, ...) {
  n = length(x)
	s1 = s2 = 0

  for (i in 1:(n-1)) {
    tmp = (x[i+1] - 1)^2 + x[i+1]
    s1 = s1 + x[i]^2 + tmp - 1
    s2 = s2 - x[i]^2 - tmp + 1
  }
  max(s1, s2)
}