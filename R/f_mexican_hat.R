#' Mexican hat test function generator.
#'
#' The Mexican hat function is defined slightly differently by
#' different people. The definition used here is
#'
#' \deqn{f(x) = -(1 - x'x) * \exp\left(-\frac{x'x}{2}\right)}{f(x) = -(1 - x'x) * exp(-0.5 * x'x)}
#'
#' Note that we have flipped the sign of the function so that it is a
#' minimization problem like all other SOO functions.
#'
#' @param dimensions [\code{integer(1)}] Size of parameter space.
#' @return A \code{soo_function}.
#' @export
#' @useDynLib soobench do_f_mexican_hat
generate_mexican_hat_function <- function(dimensions)
  soo_function(name="Mexican hat",
               id=sprintf("mexican-hat-%id", dimensions),
               fun=function(x, ...) .Call(do_f_mexican_hat, x),
               dimensions=dimensions,
               lower_bounds=rep(-5, dimensions),
               upper_bounds=rep(5, dimensions),
               best_par=rep(0, dimensions),
               best_value=-1)

## Set attributes for soo_function_generator class.
class(generate_mexican_hat_function) <- c("soo_function_generator", "function")
attr(generate_mexican_hat_function, "id") <- "mexican-hat"
attr(generate_mexican_hat_function, "name") <- "Mexican hat test function"
