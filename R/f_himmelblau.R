#' Generator for the Himmelblau test function.
#'
#' The function is defined as:
#'
#' \deqn{
#'   f(x) = (x_1^2 + x_2 - 11)^2 + (x_1 + x_2^2 - 7)^2
#' }
#'
#' @return A \code{soo_function}.
#'
#' @examples
#' f <- generate_himmelblau_function()
#' plot(f, rank=TRUE)
#'
#' @export
#' @useDynLib soobench do_f_himmelblau
generate_himmelblau_function <- function()
  soo_function(name="Himmelblau", id="himmelblau",
               dimensions=2,
               fun=function(x) .Call(do_f_himmelblau, x),
               lower_bounds=c(-5, -5),
               upper_bounds=c(5, 5),
               best_par=list(c(3, 2),
                 c(-2.805118, 3.131312),
                 c(-3.779310, -3.283186),
                 c(3.584428, -1.848126)),
               best_value=0)


class(generate_himmelblau_function) <- c("soo_function_generator", "function")
attr(generate_himmelblau_function, "id") <- "himmelblau"
attr(generate_himmelblau_function, "name") <- "Himmelblau test function"

## Pure R implementation for reference purposes:
f_himmelblau <- function(x) {
  x1 <- x[1]
  x2 <- x[2]
  (x1^2 + x2 - 11)^2 + (x1 + x2^2 - 7)^2
}
