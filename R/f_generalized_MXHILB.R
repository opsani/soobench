#' Generalized MXHILB test function generator.
#'
#' The generalized MXHILB test function is defined as
#'
#'   \deqn{f(x) = \max_{1 \leq i \neq n} \left| \sum_{j=1}^{n} \frac{x_j}{i+j-1}\right|}
#'
#' @param dimensions [\code{integer(1)}] Size of parameter space.
#' @return A \code{soo_function}.
#' 
#' @references Haarala, M. and Miettinen, K. and Maekelae, M. M., New limited
#' memory bundle method for large-scale nonsmooth optimization.
#'
#' @export
#' @useDynLib soobench do_f_generalized_mxhilb
generate_generalized_mxhilb_function <- function(dimensions)
  soo_function(name="Generalized MXHILB",
               id=sprintf("generalized-mxhilb-%id", dimensions),
               fun=function(x) .Call(do_f_generalized_mxhilb, x),
               dimensions=dimensions,
               lower_bounds=rep(-10, dimensions),
               upper_bounds=rep(10, dimensions),
               best_par=rep(0, dimensions),
               best_value=0)
  
class(generate_generalized_mxhilb_function) <- "soo_function_generator"
attr(generate_generalized_mxhilb_function, "id") <- "generalized_mxhilb"
attr(generate_generalized_mxhilb_function, "name") <- "Generalized MXHILB test function"
