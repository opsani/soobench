#' Sphere test function generator.
#'
#' The sphere function is arguably the simplest test function. It is
#' defined as
#'
#'   \deqn{f(x) = \sum_{i=1}^n x_i^2}
#' 
#' @param dimensions [\code{integer(1)}]  Size of parameter space.
#' @return A \code{soo_function}.
#' 
#' @references K. D. De Jong. An analysis of the behavior of a class
#' of genetic adaptive systems. PhD thesis, Department of Computer
#' and  Communication Sciences, University of Michigan, Ann Arbor,
#' 1975.
#' 
#' @export
#' @useDynLib soobench do_f_sphere
generate_sphere_function <- function(dimensions) {
  soo_function(name="Sphere",
               id=sprintf("sphere-%id", dimensions),
               fun=function(x, ...) .Call(do_f_sphere, x),
               dimensions=dimensions,
               lower_bounds=rep(-5.12, dimensions),
               upper_bounds=rep(5.12, dimensions),
               best_par=rep(0, dimensions),
               best_value=0)
}

## Set attributes for soo_function_generator class.
class(generate_sphere_function) <- "soo_function_generator"
attr(generate_sphere_function, "id") <- "sphere"
attr(generate_sphere_function, "name") <- "Sphere test function"
