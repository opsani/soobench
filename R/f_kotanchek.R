##' Kotanchek test function generator.
##'
##' The definition used is
##'
##'   \deqn{f(x) = - \frac{\exp\left(-(x_1 - 1)^2\right)}{1.2 + \left(x_1 - 2.5\right)^2}}
##'
##' @return A \code{soo_function}.
##' @export
##' @useDynLib soobench do_f_kotanchek
generate_kotanchek_function <- function()
  soo_function(name="Kotanchek",
               id="kotanchek",
               fun=function(x, ...) .Call(do_f_kotanchek, x),
               dimensions=2,
               lower_bounds=c(0, 0),
               upper_bounds=c(4, 4),
               best_par=c(2.5, 1),
               best_value=-0.83333333333333333333333333333)

class(generate_kotanchek_function) <- c("soo_function_generator", "function")
attr(generate_kotanchek_function, "id") <- "kotanchek"
attr(generate_kotanchek_function, "name") <- "Kotanchek test function"

## Pure R implementation:
f_kotanchek <- function(x) {
    x1 <- x[1]
    x2 <- x[2]
    -exp(-(x[2] - 1)^2)/(1.2 + (x[1] - 2.5)^2)
}
