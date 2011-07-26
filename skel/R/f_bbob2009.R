##' BBOB 2009 test function generator.
##'
##' @param dimensions Size of parameter space.
##' @param fid Function ID.
##' @param iid Instance ID, defaults to \code{1L}.
##' @return A \code{soo_function}.
##' @export
##' @useDynLib soobench do_bbob_opt do_bbob_eval
bbob2009_function <- function(dimensions, fid, iid) {
  fid <- as.integer(fid)
  iid <- as.integer(iid)
  opt <- .Call(do_bbob_opt, fid, iid, as.integer(dimensions))
  f <- function(x) {}
  body(f) <- substitute(.Call(do_bbob_eval, fid, iid, x),
                        list(fid=fid, iid=iid))

  fn <- soo_function(name=sprintf("BBOB 2009 function %i (instance %i)", fid, iid),
                     id=sprintf("bbob2009-%02i-%02i-%id", fid, iid, dimensions),
                     fun=f,
                     dimensions=dimensions,
                     lower_bounds=rep(-5, dimensions),
                     upper_bounds=rep(5, dimensions),
                     best_par=opt[[1]],
                     best_value=opt[[2]])
  attr(fn, "fid", fid)
  attr(fn, "iid", iid)
  class(fn) <- c("bbob2009_function", class(fn))
  fn
}

##' @S3method function_name bbob2009_function
##' @method function_name bbob2009_function
##' @rdname function_name.Rd
function_name.bbob2009_function <- function(fn) {
  fid <- attr(fn, "fid")
  iid <- attr(fn, "iid")
  sprintf("BBOB 2009 test function Nr. %i (instance %i)", fid, iid)
}
