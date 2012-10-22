##' Generator for the Ackley test function.
##'
##' The definition used is
##'
##'   \deqn{f(x) = \displaystyle -20 \exp\left(-0.2 \sqrt{\frac{1}{n} \sum_{i=1}^n\left(x_i^2\right)}\right) - \exp\left(\frac{1}{n}\sum_{i=1}^n \cos\left(2 \pi x_i \right)\right) + 20 + \exp(1)}
##'
##' @param dimensions Size of parameter space.
##' @return A \code{soo_function}.
##'
##' @examples
##' f <- generate_ackley_function(2)
##' plot(f, rank=TRUE)
##' 
##' @references D. H. Ackley. A connectionist machine for genetic hillclimbing. 
##' Kluwer Academic Publishers, Boston, 1987
##'
##' @export
##' @useDynLib soobench do_f_ackley
generate_ackley_function <- function(dimensions)
  soo_function(name="Ackley", id=sprintf("ackley-%id", dimensions),
               dimensions=dimensions,
               fun=function(x) .Call(do_f_ackley, x),
               lower_bounds=rep(-32.786, dimensions),
               upper_bounds=rep(32.786, dimensions),
               best_par=rep(0, dimensions),
               best_value=0)


class(generate_ackley_function) <- "soo_function_generator"
attr(generate_ackley_function, "id") <- "ackley"
attr(generate_ackley_function, "name") <- "Ackley test function"

## Pure R implementation for reference purposes:
f_ackley <- function(x) {
  a <- 20
  b <- 0.2
  c <- 2 * pi
  d <- length(x)
  c1 <- sqrt(crossprod(x) / d)
  c2 <- sum(cos(c * x)) / d
  -a * exp(-b * c1) - exp(c2) + a + exp(1)
}
