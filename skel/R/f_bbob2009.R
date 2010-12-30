##' @useDynLib soobench do_bbob_opt do_bbob_eval
NA

##' BBOB 2009 test function.
##'
##' @usage
##'  f_bbob2009(x, fid, iid)
##'  f_bbob2009_01(x, iid=1)
##'  f_bbob2009_02(x, iid=1)
##'  f_bbob2009_03(x, iid=1)
##'  f_bbob2009_04(x, iid=1)
##'  f_bbob2009_05(x, iid=1)
##'  f_bbob2009_06(x, iid=1)
##'  f_bbob2009_07(x, iid=1)
##'  f_bbob2009_08(x, iid=1)
##'  f_bbob2009_09(x, iid=1)
##'  f_bbob2009_10(x, iid=1)
##'  f_bbob2009_11(x, iid=1)
##'  f_bbob2009_12(x, iid=1)
##'  f_bbob2009_13(x, iid=1)
##'  f_bbob2009_14(x, iid=1)
##'  f_bbob2009_15(x, iid=1)
##'  f_bbob2009_16(x, iid=1)
##'  f_bbob2009_17(x, iid=1)
##'  f_bbob2009_18(x, iid=1)
##'  f_bbob2009_19(x, iid=1)
##'  f_bbob2009_20(x, iid=1)
##'  f_bbob2009_21(x, iid=1)
##'  f_bbob2009_22(x, iid=1)
##'  f_bbob2009_23(x, iid=1)
##'  f_bbob2009_24(x, iid=1)
##'
##' @param x Parameter value.
##' @param fid Function ID.
##' @param iid Instance ID, defaults to \code{1L}.
##' @return Function value.
##'
##' @aliases f_bbob2009_01 f_bbob2009_02  f_bbob2009_03 f_bbob2009_04
##' f_bbob2009_05 f_bbob2009_06 f_bbob2009_07 f_bbob2009_08
##' f_bbob2009_09 f_bbob2009_10 f_bbob2009_11 f_bbob2009_12
##' f_bbob2009_13 f_bbob2009_14 f_bbob2009_15 f_bbob2009_16
##' f_bbob2009_17 f_bbob2009_18 f_bbob2009_19 f_bbob2009_20
##' f_bbob2009_21 f_bbob2009_22 f_bbob2009_23 f_bbob2009_24
##'
##' @rdname f_bbob2009
##' @exportPattern "f_bbob2009.*"
f_bbob2009 <- function(x, fid, iid)
  .Call(do_bbob_eval, as.integer(fid), as.integer(iid), x)

for (fid in 1:24) {
  name <- sprintf("f_bbob2009_%02i", fid)
  f <- function(x, iid=1L) {}
  body(f) <- substitute(.Call(do_bbob_eval, fid, as.integer(iid), x),
                        list(fid=fid))
  attr(f, "fid") <- fid
  class(f) <- "bbob2009_function"
  assign(name, f)
  rm(f)
}

##' @S3method lower_bounds bbob2009_function
##' @method lower_bounds bbob2009_function
##' @rdname bounds.Rd
lower_bounds.bbob2009_function <- function(x, dim)
  rep(-5, dim)

##' @S3method upper_bounds bbob2009_function
##' @method upper_bounds bbob2009_function
##' @rdname bounds.Rd
upper_bounds.bbob2009_function <- function(x, dim)
  rep(5, dim)

##' Retrieve global minimum of a BBOB 2009 test function.
##' 
##' @param x Function to query.
##' @param dim Dimensionality of parameter space.
##' @param iid Instance ID of function.
##' @param ... Ignored.
##' @return Global minimum.
##' @S3method global_minimum bbob2009_function
##' @method global_minimum bbob2009_function
global_minimum.bbob2009_function <- function(x, dim, iid=1L, ...) {
  fid <- attr(x, "fid")
  l <- .Call(do_bbob_opt,
             as.integer(fid), as.integer(iid), as.integer(dim))
  names(l) <- c("par", "value")
  l
}
