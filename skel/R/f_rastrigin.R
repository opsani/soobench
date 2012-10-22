##' Rastrigin test function generator.
##'
##' The definition used is
##'
##'   \deqn{f(x) = \displaystyle 10n + \sum_{i=1}^n \left(x_i^2 - 10 \cos\left(2\pi x_i\right)\right)}
##'
##' @param dimensions Size of parameter space.
##' @return A \code{soo_function}.
##'
##' @references L. A. Rastrigin. Extremal control systems.  
##' Theoretical Foundations of Engineering Cybernetics Series. 
##' (in Russian), Nauka, Moscow, 1974.
##'
##' @export
##' @useDynLib soobench do_f_rastrigin
generate_rastrigin_function <- function(dimensions)
  soo_function(name="Rastrigin",
               id=sprintf("rastrigin-%id", dimensions),
               fun=function(x, ...) .Call(do_f_rastrigin, x),
               dimensions=dimensions,
               lower_bounds=rep(-5, dimensions),
               upper_bounds=rep(5, dimensions),
               best_par=rep(0, dimensions),
               best_value=0)
               
               
## Set attributes for soo_function_generator class.
class(generate_rastrigin_function) <- "soo_function_generator"
attr(generate_rastrigin_function, "id") <- "rastrigin"
attr(generate_rastrigin_function, "name") <- "Rastrigin test function"
