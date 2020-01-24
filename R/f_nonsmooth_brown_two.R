#' Nonsmooth generalized Brown function 2 function generator.
#'
#' The generalized Brown function 2 is defined as
#'
#'   \deqn{f(x) = \sum_{i=1}^{n-1} \left(|x_i|^{x_{i+1}^2+1} + |x_{i+1}|^{x_i^2 + 1}\right)}
#'
#' @param dimensions [\code{integer(1)}] Size of parameter space.
#' @return A \code{soo_function}.
#'
#' @references Haarala, M. and Miettinen, K. and Maekelae, M. M., New limited
#' memory bundle method for large-scale nonsmooth optimization.
#'
#' @export
#' @useDynLib soobench do_f_nonsmooth_generalized_brown_2
generate_nonsmooth_generalized_brown_2_function <- function(dimensions)
  soo_function(name="Nonsmooth generalization of Brown 2",
               id=sprintf("nonsmooth-generalization-of-brown-2-%id", dimensions),
               fun=function(x, ...) .Call(do_f_nonsmooth_generalized_brown_2, x),
               dimensions=dimensions,
               lower_bounds=rep(-10, dimensions),
               upper_bounds=rep(10, dimensions),
               best_par=rep(0, dimensions),
               best_value=0)

class(generate_nonsmooth_generalized_brown_2_function) <- c("soo_function_generator", "function")
attr(generate_nonsmooth_generalized_brown_2_function, "id") <- "nonsmooth_generalized_brown_2"
attr(generate_nonsmooth_generalized_brown_2_function, "name") <- "Nonsmooth generalized Brown 2 test function"

f_nonsmooth_generalized_brown_function_2 <- function(x, ...) {
  n <- length(x)
  res <- 0
  xsq <- x^2
  for (i in 1:(n-1)) {
    res = res + abs(x[i])^(xsq[i+1] + 1) + abs(x[i+1])^(xsq[i] + 1)
  }
  res
}
