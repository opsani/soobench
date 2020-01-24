#' Generator for the Beale test function.
#'
#' The function is defined as:
#'
#' \deqn{
#'   f(x) =
#'    (1.5 - x_1 * (1 - x_2))^2
#'    + (2.25 - x_1 * (1 - x_2^2))^2
#'    + (2.625 - x_1 * (1-x_2^3))^2
#' }
#'
#' @return A \code{soo_function}.
#'
#' @examples
#' f <- generate_beale_function()
#' plot(f, rank=TRUE)
#'
#' @export
#' @useDynLib soobench do_f_beale
generate_beale_function <- function()
  soo_function(name="Beale", id="beale",
               dimensions=2,
               fun=function(x) .Call(do_f_beale, x),
               lower_bounds=c(-4.5, -4.5),
               upper_bounds=c(4.5, 4.5),
               best_par=c(3, 0.5),
               best_value=0)


class(generate_beale_function) <- c("soo_function_generator", "function")
attr(generate_beale_function, "id") <- "beale"
attr(generate_beale_function, "name") <- "Beale test function"

## Pure R implementation for reference purposes:
f_beale <- function(x) {
  x1 <- x[1]
  x2 <- x[2]
  (1.5 - x1*(1 - x2))^2 + (2.25 - x1*(1 - x2^2))^2 + (2.625 - x1*(1-x2^3))^2
}
