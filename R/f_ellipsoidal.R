#' Generator for ellipsoidal test functions.
#'
#' The ellipsoidal test function is a badly conditioned variant of
#' the sphere function. The definition used here is
#'
#' \deqn{f(x) = \sum_{i=1}^n 10^{6\frac{i}{n}}x_i^2}
#' 
#' @param dimensions [\code{integer(1)}] Size of parameter space.
#' @return A \code{soo_function}.
#'
#' #' Note that the functions returned by this generator only differ in
#' the elongated axis from those returned by
#' \code{\link{generate_ellipsoid_function}}.
#'
#' @examples
#' f <- generate_ellipsoidal_function(2)
#' plot(f, rank=TRUE)
#' 
#' #' @export
#' @useDynLib soobench do_f_ellipsoidal
generate_ellipsoidal_function <- function(dimensions)
  soo_function(name="Ellispoidal",
               id=sprintf("ellipsoidal-%id", dimensions),
               fun=function(x, ...) .Call(do_f_ellipsoidal, x),
               dimensions=dimensions,
               lower_bounds=rep(-32.786, dimensions),
               upper_bounds=rep(32.786, dimensions),
               best_par=rep(0, dimensions),
               best_value=0)
               
## Set attributes for soo_function_generator class.
class(generate_ellipsoidal_function) <- "soo_function_generator"
attr(generate_ellipsoidal_function, "id") <- "ellipsoidal"
attr(generate_ellipsoidal_function, "name") <- "Ellipsoidal test function"


## Pure R reference implementation:
f_ellipsoidal <- function(x) {
  n <- length(x)
  c1 <- 6 * (1:n) / n
  s <- sum(10^c1 * x^2)
  return(s)
}
