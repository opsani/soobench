#' Generator for the Goldstein-Price function.
#'
#' The definition used is
#'
#'   \deqn{f(x) = \left(1 + \left(x_1 + x_2 + 1\right)^2 \left(19 - 14x_1 + 13x_1^2 - 14x_2 + 6x_1x_2 + 3x_2^2\right)\right)\left(30 + \left(2x_1 - 3x_2\right)^2\left(18 - 32x_1 + 12x_1^2 + 48x_2 - 36x_1x_2 + 27x_2^2\right)\right)}
#' 
#' @return A \code{soo_function}.
#'
#' @examples
#' f <- generate_goldstein_price_function()
#' plot(f, rank=TRUE)
#'
#' @references Goldstein, A. A. and Price, I. F. On descent from local minima, 
#'   Mathematics of Computation 25, 569-574, 1971.
#'
#' @export
#' @useDynLib soobench do_f_goldstein_price
generate_goldstein_price_function <- function()
  soo_function(name="Goldstein-Price",
               id="goldstein-price",
               fun=function(x, ...) .Call(do_f_goldstein_price, x),
               dimensions=2,
               lower_bounds=c(-2, -2),
               upper_bounds=c(2, 2),
               best_par=c(0, -1),
               best_value=3)

class(generate_goldstein_price_function) <- "soo_function_generator"
attr(generate_goldstein_price_function, "id") <- "goldstein-price"
attr(generate_goldstein_price_function, "name") <- "Goldstein-Price test function"

## Pure R reference implementation:
f_goldsteinprice <- function(x) {
  (1 + (x[1]+x[2]+1)^2 * (19 - 14*x[1] + 3*x[1]^2 - 14*x[2] + 6*x[1]*x[2] + 3*x[2]^2)) *
    (30 + (2*x[1] - 3*x[2])^2 * (18 - 32*x[1] + 12*x[1]^2 + 48*x[2] - 36*x[1]*x[2] + 27*x[2]^2))
}
