#' Generator for the Weierstrass function.
#'
#' The definition used is
#'
#'   \deqn{f(x) = \displaystyle \sum_{i=1}^n \left( \sum_{k=0}^{20} \left(0.5^k \cos \left(2 \pi 3^k \left(x_i + 0.5 \right)\right)\right]\right) - n \sum_{k=0}^{20} \left[a^k \cos \left( \pi b^k \right)\right)}
#'
#' @param dimensions [\code{integer(1)}] Size of parameter space.
#'
#' @return A \code{soo_function}.
#'
#' @examples
#' f <- generate_weierstrass_function(2)
#' plot(f, rank=TRUE)
#'
#' @export
#' @useDynLib soobench do_f_weierstrass
generate_weierstrass_function <- function(dimensions)
  soo_function(name="Weierstrass", id=sprintf("weierstrass-%id", dimensions),
               dimensions=dimensions,
               fun=function(x) .Call(do_f_weierstrass, x),
               lower_bounds=rep(-0.5, dimensions),
               upper_bounds=rep(0.5, dimensions),
               best_par=rep(0, dimensions),
               best_value=0)

## Set attributes for soo_function_generator class.
class(generate_weierstrass_function) <- c("soo_function_generator", "function")
attr(generate_weierstrass_function, "id") <- "weierstrass"
attr(generate_weierstrass_function, "name") <- "Weierstrass test function"
