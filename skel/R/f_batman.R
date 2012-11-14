##' Generator for the Batman function.
##'
##' The definition used is
##'
##' \deqn{f(x) = \left[\left((x^Tx)^2 - (\sum_{i=1}^n)^2\right)^2\right]^\alpha + \frac{1}{N}\left(\frac{1}{2}x^Tx + \sum_{i=1}^n x_i\right) + \frac{1}{2}}
##'
##' @param dimensions Size of parameter space.
##' @param alpha Parameter for control of groove shape
##' @return A \code{soo_function}.
##'
##' @examples
##' f <- generate_batman_function(2, 1/4)
##' plot(f)
##'
##' @references H.-G. Beyer and S. Finck. HappyCat – A Simple Function Class 
##' Where Well-Known Direct Search Algorithms Do Fail.
##' In: PPSN XII (Parallel Problem Solving from Nature), 367-376, 
##' Springer, Heidelberg, 2012.
##'
##' @export
##' @useDynLib soobench do_eval_batman
##' @rdname generate_batman_function
generate_batman_function <- function(dimensions, alpha) {
  if(alpha < 0) 
    warning("Alpha should be greater zero. Otherwise you lose the global optimum!")
  f <- function(x) {}
  body(f) <- substitute(.Call(do_eval_batman, alpha, x), 
                        list(alpha=alpha))
  soo_function(name="Batman", 
               id=sprintf("batman-%id-%5.3f", dimensions, alpha),
               dimensions=dimensions,
               fun=f,
               ## lower and upper bounds unknown until now
               lower_bounds=rep(-2, dimensions),
               upper_bounds=rep(2, dimensions),
               best_par=rep(-1, dimensions),
               best_value=0)
}

class(generate_batman_function) <- "soo_function_generator"
attr(generate_batman_function, "id") <- "batman"
attr(generate_batman_function, "name") <- "Batman test function"
