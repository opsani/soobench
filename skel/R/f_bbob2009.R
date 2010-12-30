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
