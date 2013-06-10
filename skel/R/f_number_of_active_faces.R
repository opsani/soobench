##' Number of active faces test function generator.
##'
##' The number of active faces function test function is defined as
##'
##'   \deqn{f(x) = \max_{1 \leq i \leq n} \left\{\ln\left(\left|-\sum_{i=1}^{n} x_i\right| + 1\right), \ln(|x_i| + 1)\right\}}
##' 
##' @param dimensions [\code{integer(1)}] Size of parameter space.
##' @return A \code{soo_function}.
##'
##' @references Haarala, M. and Miettinen, K. and Maekelae, M. M., New limited
##' memory bundle method for large-scale nonsmooth optimization.
##'
##' @export
generate_number_of_active_faces_function <- function(dimensions)
  soo_function(name="Number of active faces",
               id=sprintf("number-of-active-faces-%id", dimensions),
               fun=f_number_of_active_faces_function,
               dimensions=dimensions,
               lower_bounds=rep(-Inf, dimensions),
               upper_bounds=rep(Inf, dimensions),
               #FIXME: unknown param values
               best_par=rep(0, dimensions),
               best_value=0)
  
class(generate_number_of_active_faces_function) <- "soo_function_generator"
attr(generate_number_of_active_faces_function, "id") <- "number_of_active_faces"
attr(generate_number_of_active_faces_function, "name") <- "Number of active faces test function"

f_number_of_active_faces_function <- function(x, ...) {
	s = sum(x)
  tmp = c(log(abs(-s)+1), log(abs(x))+1)
  max(tmp)
}