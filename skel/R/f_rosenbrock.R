##' Rosenbrock test function generator.
##'
##' The definition used is
##'
##'   \deqn{f(x) = \displaystyle\sum_{i=1}^{n-1} \left[100\left(x_{i+1} - x_i^2\right)^2 + \left(x_i - 1\right)^2\right]}
##'
##' @param dimensions Size of parameter space.
##' @return A \code{soo_function}.
##'
##' @references H. H. Rosenbrock. An Automatic Method for Finding the 
##' Greatest or Least Value of a Function.
##' The Computer Journal, 3(3):175-184, 1960. 
##' 
##' @export
##' @useDynLib soobench do_f_rosenbrock
generate_rosenbrock_function <- function(dimensions)
  soo_function(name="Rosenbrock",
               id=sprintf("rosenbrock-%id", dimensions),
               fun=function(x, ...) .Call(do_f_rosenbrock, x),
               dimensions=dimensions,
               lower_bounds=rep(-2.048, dimensions),
               upper_bounds=rep(2.048, dimensions),
               best_par=rep(1, dimensions),
               best_value=0)
            
               
## Set attributes for soo_function_generator class.
class(generate_rosenbrock_function) <- "soo_function_generator"
attr(generate_rosenbrock_function, "id") <- "rosenbrock"
attr(generate_rosenbrock_function, "name") <- "Rosenbrock test function"

## Pure R reference implementation:
f_rosenbrock <- function(x) {
  d <- length(x)
  hx <- x[1:(d-1)]
  tx <- x[2:d]
  sum(100 * (tx - hx^2)^2 + (hx - 1)^2)
}
