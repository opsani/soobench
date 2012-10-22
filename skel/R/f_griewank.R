##' Griewank test function generator.
##'
##' The definition used is
##'
##'   \deqn{f(x) = \displaystyle \sum_{i=1}^n \frac{x_i^2}{4000} - \prod_{i=1}^n \cos \left(\frac{x_i}{\sqrt{i}}\right) + 1}
##'
##' @param dimensions Size of parameter space.
##' @return A \code{soo_function}.
##' 
##' @references A. O. Griewank. Generalized descent for global optimization. 
##' Journal of Optimization Theory and Applications 34:11-39, 1981.
##'
##' @export
##' @useDynLib soobench do_f_griewank
generate_griewank_function <- function(dimensions)
  soo_function(name="Griewank",
               id=sprintf("griewank-%id", dimensions),
               fun=function(x, ...) .Call(do_f_griewank, x),
               dimensions=dimensions,
               lower_bounds=rep(-600, dimensions),
               upper_bounds=rep(600, dimensions),
               best_par=rep(0, dimensions),
               best_value=0)

## Set attributes for soo_function_generator class.
class(generate_griewank_function) <- "soo_function_generator"
attr(generate_griewank_function, "id") <- "griewank"
attr(generate_griewank_function, "name") <- "Griewank test function"
