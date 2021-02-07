#' soobench: Collection of single objective optimization test problems for R.
#'
#' The soobench package provides a number of test function generators named according to the
#' convention "generate_<name>_function()" e.g. "generate_rosenbrock_function()".
#'
#' @section Test functions:
#' These function generators share common signatures: most take a "dimension" argument of type int,
#' where dimension is the desired dimensionality of the returned function and must be positive. For
#' example, "f <- generate_rosenbrock_function(4)" will return "f", which is a function from the
#' four-dimensional product space of the real numbers to the reals. In this running example,
#' f(c(-1,1,-2,2)) will return 1313, which is the value of the Rosenbrock test function evaluated at
#' the point (-1,1,-2,2).
#'
#' A small number of these test function generators require different arguments, and if you run into
#' one you can obtain more thorough documentation on these different, additional arguments by
#' running e.g. "help(generate_bbob2009_function)".
#'
#' @docType package
#' @name soobench
NULL
