##' @useDynLib soobench
NA

.generate_bbob09_instance <- function(fid, tid) {
  fid <- as.integer(fid)
  tid <- as.integer(tid)
  f <- function(x) {}
  body(f) <- substitute(.Call("do_bbob_eval", fid, tid, x, PACKAGE="soobench"),
                        list(fid=fid, tid=tid))
  class(f) <- "bbob09_function"  
  rm(fid, tid)
  f
}

##' Create a BBOB 2009 problem instance.
##' 
##' @param funid Function id. Possible values are 1 to 24.
##' @param iid Instance id of the function.
##' @param dim Dimensionality of the problem.
##' @return An instance of a \code{box_constrained_problem}.
##' @export
bbob2009_problem <- function(funid, iid, dim) {
  stopifnot(dim > 1)  
  f <- .generate_bbob09_instance(funid, iid)
  box_constrained_problem(f,
                          lower=rep(-5, dim),
                          upper=rep(5, dim))
}

##' Create a BBOB 2009 problem instance.
##' 
##' @param funid Function id. Possible values are 1 to 24.
##' @param iid Instance id of the function.
##' @param dim Dimensionality of the problem.
##' @return An list containing the optimal paramater settings
##'   (\code{par}) and the function value at that point (\code{value}).
##' @export
bbob2009_optimum <- function(funid, iid, dim) {
  l <- .Call("do_bbob_opt",
             as.integer(funid), as.integer(iid), as.integer(dim),
             PACKAGE="soobench")
  names(l) <- c("par", "value")
  return(l)
}

## The following block used to be a tight for() loop, but for roxygen
## to work, we need each explicit declaration.

##' BBOB 2009 test function.
##'
##' @param x Parameter value.
##' @param iid Instance ID, defaults to \code{1L}.
##' @return Function value
##' @rdname f_bbob2009
##' @export
f_bbob2009_01 <- function(x, iid=1L)
  .Call("do_bbob_eval",  1L, as.integer(iid), x, PACKAGE="soobench")

##' @rdname f_bbob2009
##' @export
f_bbob2009_02 <- function(x, iid=1L)
  .Call("do_bbob_eval",  2L, as.integer(iid), x, PACKAGE="soobench")

##' @rdname f_bbob2009
##' @export
f_bbob2009_03 <- function(x, iid=1L)
  .Call("do_bbob_eval",  3L, as.integer(iid), x, PACKAGE="soobench")

##' @rdname f_bbob2009
##' @export
f_bbob2009_04 <- function(x, iid=1L)
  .Call("do_bbob_eval",  4L, as.integer(iid), x, PACKAGE="soobench")

##' @rdname f_bbob2009
##' @export
f_bbob2009_05 <- function(x, iid=1L)
  .Call("do_bbob_eval",  5L, as.integer(iid), x, PACKAGE="soobench")

##' @rdname f_bbob2009
##' @export
f_bbob2009_06 <- function(x, iid=1L)
  .Call("do_bbob_eval",  6L, as.integer(iid), x, PACKAGE="soobench")

##' @rdname f_bbob2009
##' @export
f_bbob2009_07 <- function(x, iid=1L)
  .Call("do_bbob_eval",  7L, as.integer(iid), x, PACKAGE="soobench")

##' @rdname f_bbob2009
##' @export
f_bbob2009_08 <- function(x, iid=1L)
  .Call("do_bbob_eval",  8L, as.integer(iid), x, PACKAGE="soobench")

##' @rdname f_bbob2009
##' @export
f_bbob2009_09 <- function(x, iid=1L)
  .Call("do_bbob_eval",  9L, as.integer(iid), x, PACKAGE="soobench")

##' @rdname f_bbob2009
##' @export
f_bbob2009_10 <- function(x, iid=1L)
  .Call("do_bbob_eval", 10L, as.integer(iid), x, PACKAGE="soobench")

##' @rdname f_bbob2009
##' @export
f_bbob2009_11 <- function(x, iid=1L)
  .Call("do_bbob_eval", 11L, as.integer(iid), x, PACKAGE="soobench")

##' @rdname f_bbob2009
##' @export
f_bbob2009_12 <- function(x, iid=1L)
  .Call("do_bbob_eval", 12L, as.integer(iid), x, PACKAGE="soobench")

##' @rdname f_bbob2009
##' @export
f_bbob2009_13 <- function(x, iid=1L)
  .Call("do_bbob_eval", 13L, as.integer(iid), x, PACKAGE="soobench")

##' @rdname f_bbob2009
##' @export
f_bbob2009_14 <- function(x, iid=1L)
  .Call("do_bbob_eval", 14L, as.integer(iid), x, PACKAGE="soobench")

##' @rdname f_bbob2009
##' @export
f_bbob2009_15 <- function(x, iid=1L)
  .Call("do_bbob_eval", 15L, as.integer(iid), x, PACKAGE="soobench")

##' @rdname f_bbob2009
##' @export
f_bbob2009_16 <- function(x, iid=1L)
  .Call("do_bbob_eval", 16L, as.integer(iid), x, PACKAGE="soobench")

##' @rdname f_bbob2009
##' @export
f_bbob2009_17 <- function(x, iid=1L)
  .Call("do_bbob_eval", 17L, as.integer(iid), x, PACKAGE="soobench")

##' @rdname f_bbob2009
##' @export
f_bbob2009_18 <- function(x, iid=1L)
  .Call("do_bbob_eval", 18L, as.integer(iid), x, PACKAGE="soobench")

##' @rdname f_bbob2009
##' @export
f_bbob2009_19 <- function(x, iid=1L)
  .Call("do_bbob_eval", 19L, as.integer(iid), x, PACKAGE="soobench")

##' @rdname f_bbob2009
##' @export
f_bbob2009_20 <- function(x, iid=1L)
  .Call("do_bbob_eval", 20L, as.integer(iid), x, PACKAGE="soobench")

##' @rdname f_bbob2009
##' @export
f_bbob2009_21 <- function(x, iid=1L)
  .Call("do_bbob_eval", 21L, as.integer(iid), x, PACKAGE="soobench")

##' @rdname f_bbob2009
##' @export
f_bbob2009_22 <- function(x, iid=1L)
  .Call("do_bbob_eval", 22L, as.integer(iid), x, PACKAGE="soobench")

##' @rdname f_bbob2009
##' @export
f_bbob2009_23 <- function(x, iid=1L)
  .Call("do_bbob_eval", 23L, as.integer(iid), x, PACKAGE="soobench")

##' @rdname f_bbob2009
##' @export
f_bbob2009_24 <- function(x, iid=1L)
  .Call("do_bbob_eval", 24L, as.integer(iid), x, PACKAGE="soobench")
