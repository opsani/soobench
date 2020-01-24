#' Discus test function generator.
#'
#' The discus test function is similar to a high condition
#' ellipsoid. It is defined as
#'
#'   \deqn{f(x) = 10^6 x_1^2 + \sum_{i=2}^n x_i^2}
#'
#' @param dimensions [\code{integer(1)}] Size of parameter space.
#' @return A \code{soo_function}.
#'
#' Note that the functions returned by this generator only differ in
#' the elongated axis from those returned by
#' \code{\link{generate_ellipsoidal_function}}.
#'
#' @export
#' @useDynLib soobench do_f_discus
generate_discus_function <- function(dimensions) {
  stopifnot(dimensions >= 2)
  soo_function(name="Discus",
               id=sprintf("discus-%id", dimensions),
               fun=function(x, ...) .Call(do_f_discus, x),
               dimensions=dimensions,
               lower_bounds=rep(-32.768, dimensions),
               upper_bounds=rep(32.768, dimensions),
               best_par=rep(0, dimensions),
               best_value=0)
}

class(generate_discus_function) <- c("soo_function_generator", "function")
attr(generate_discus_function, "id") <- "discus"
attr(generate_discus_function, "name") <- "Discus test function"
