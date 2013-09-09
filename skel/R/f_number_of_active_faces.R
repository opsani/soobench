##' Number of active faces test function generator.
##'
##' The number of active faces function test function is defined as
##'
##'   \deqn{f(x) = \max_{1 \leq i \leq n} \left\{\ln\left(\left|\sum_{i=1}^{n} x_i\right| + 1\right), \ln(|x_i| + 1)\right\}}
##' 
##' @param dimensions [\code{integer(1)}] Size of parameter space.
##' @return A \code{soo_function}.
##'
##' @references Haarala, M. and Miettinen, K. and Maekelae, M. M., New limited
##' memory bundle method for large-scale nonsmooth optimization.
##'
##' @export
##' @useDynLib soobench do_f_number_of_active_faces
generate_number_of_active_faces_function <- function(dimensions)
  soo_function(name="Number of active faces",
               id=sprintf("number-of-active-faces-%id", dimensions),
               fun=function(x, ...) .Call(do_f_number_of_active_faces, x),
               dimensions=dimensions,
               lower_bounds=rep(-10, dimensions),
               upper_bounds=rep(10, dimensions),
               best_par=rep(0, dimensions),
               best_value=0)
  
class(generate_number_of_active_faces_function) <- "soo_function_generator"
attr(generate_number_of_active_faces_function, "id") <- "number_of_active_faces"
attr(generate_number_of_active_faces_function, "name") <- "Number of active faces test function"
