##' Generator for the Happycat function.
##'
##' @param dimensions Size of parameter space.
##' @param alpha Parameter for control of groove shape
##' @return A \code{soo_function}.
##'
##' The definition used is
##'
##' \deqn{f(x) = \left[(x^Tx - n)^2\right]^\alpha + \frac{1}{N}\left(\frac{1}{2}x^Tx + \sum_{i=1}^n x_i\right) + \frac{1}{2}}
##'
##'
##' @references For a complete description of the happyCat test function
##' see ...
##'
##' @export
##' @useDynLib soobench do_eval_happycat
##' @rdname generate_happycat_function
generate_happycat_function <- function(dimensions, alpha) {
  f <- function(x) {}
  body(f) <- substitute(.Call(do_eval_happycat, alpha, x), 
                        list(alpha=alpha))
  soo_function(name="Happycat", 
               id=sprintf("happycat-%id", dimensions),
               dimensions=dimensions,
               fun=f,
			   # lower and upper bounds unknown until now
               lower_bounds=rep(-2, dimensions),
               upper_bounds=rep(2, dimensions),
               best_par=rep(-1, dimensions),
               best_value=0)
}

class(generate_happycat_function) <- "soo_function_generator"
attr(generate_happycat_function, "id") <- "happycat"
attr(generate_happycat_function, "name") <- "HappyCat test function"
