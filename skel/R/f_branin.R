#' Generator for the Branin test function.
#'
#' This function is a 2D test function. The generator does not take
#' any parameters. It is defined as
#'
#'   \deqn{f(x) = \displaystyle\left(x_2 - \frac{5.1}{4\pi^2}x_1^2 + \frac{5}{\pi}x_1 - 6\right)^2 + 10\left(1 - \frac{1}{8\pi}\right)\cos(x_1) + 10}
#' 
#' @examples
#' f <- generate_branin_function()
#' plot(f, rank=TRUE)
#' 
#' @return A \code{soo_function}.
#' @references F. H. Branin. 1972. Widely convergent method for finding 
#' multiple solutions of simultaneous nonlinear equations. 
#' IBM J. Res. Dev. 16, 5 (September 1972), 504-522. 
#' @export
#' @useDynLib soobench do_f_branin
generate_branin_function <- function()
  soo_function(name="Branin", id="branin",
               dimensions=2,
               fun=function(x) .Call(do_f_branin, x),
               lower_bounds=c(-5, 0),
               upper_bounds=c(10, 15),
               best_par=list(c(-pi, 12.275),
                             c(pi, 2.275),
                             c(3*pi, 2.475)),
               best_value=0.3978873577297381558537381351925432682037353515625)

               
class(generate_branin_function) <- "soo_function_generator"
attr(generate_branin_function, "id") <- "branin"
attr(generate_branin_function, "name") <- "Branin test function"

## Pure R reference implementation:
f_branin <- function(x) {
  stopifnot(length(x) == 2)
  x1 <- x[1]
  x2 <- x[2]
  a <- 1
  b <- 5.1 / (2*pi)^2
  c <- 5 / pi
  d <- 6
  e <- 10
  f <- 1 / (8 * pi)
  a * (x2 - b * x1^2 + c * x1 - d)^2 + e * (1 - f) * cos(x1) + e
}
