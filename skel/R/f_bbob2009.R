##' @useDynLib soobench do_bbob_opt do_bbob_eval
NA

##' BBOB 2009 test function.
##'
##' @usage
##'  f_bbob2009(x, fid, iid)
##'  f_bbob2009_01_01(x)
##'  f_bbob2009_24_15(x)
##'
##' @param x Parameter value.
##' @param fid Function ID.
##' @param iid Instance ID, defaults to \code{1L}.
##' @return Function value.
##'
##' @aliases
##'  f_bbob2009_01_01 f_bbob2009_01_02 f_bbob2009_01_03 f_bbob2009_01_04
##'  f_bbob2009_01_05 f_bbob2009_01_06 f_bbob2009_01_07 f_bbob2009_01_08
##'  f_bbob2009_01_09 f_bbob2009_01_10 f_bbob2009_01_11 f_bbob2009_01_12
##'  f_bbob2009_01_13 f_bbob2009_01_14 f_bbob2009_01_15 f_bbob2009_02_01
##'  f_bbob2009_02_02 f_bbob2009_02_03 f_bbob2009_02_04 f_bbob2009_02_05
##'  f_bbob2009_02_06 f_bbob2009_02_07 f_bbob2009_02_08 f_bbob2009_02_09
##'  f_bbob2009_02_10 f_bbob2009_02_11 f_bbob2009_02_12 f_bbob2009_02_13
##'  f_bbob2009_02_14 f_bbob2009_02_15 f_bbob2009_03_01 f_bbob2009_03_02
##'  f_bbob2009_03_03 f_bbob2009_03_04 f_bbob2009_03_05 f_bbob2009_03_06
##'  f_bbob2009_03_07 f_bbob2009_03_08 f_bbob2009_03_09 f_bbob2009_03_10
##'  f_bbob2009_03_11 f_bbob2009_03_12 f_bbob2009_03_13 f_bbob2009_03_14
##'  f_bbob2009_03_15 f_bbob2009_04_01 f_bbob2009_04_02 f_bbob2009_04_03
##'  f_bbob2009_04_04 f_bbob2009_04_05 f_bbob2009_04_06 f_bbob2009_04_07
##'  f_bbob2009_04_08 f_bbob2009_04_09 f_bbob2009_04_10 f_bbob2009_04_11
##'  f_bbob2009_04_12 f_bbob2009_04_13 f_bbob2009_04_14 f_bbob2009_04_15
##'  f_bbob2009_05_01 f_bbob2009_05_02 f_bbob2009_05_03 f_bbob2009_05_04
##'  f_bbob2009_05_05 f_bbob2009_05_06 f_bbob2009_05_07 f_bbob2009_05_08
##'  f_bbob2009_05_09 f_bbob2009_05_10 f_bbob2009_05_11 f_bbob2009_05_12
##'  f_bbob2009_05_13 f_bbob2009_05_14 f_bbob2009_05_15 f_bbob2009_06_01
##'  f_bbob2009_06_02 f_bbob2009_06_03 f_bbob2009_06_04 f_bbob2009_06_05
##'  f_bbob2009_06_06 f_bbob2009_06_07 f_bbob2009_06_08 f_bbob2009_06_09
##'  f_bbob2009_06_10 f_bbob2009_06_11 f_bbob2009_06_12 f_bbob2009_06_13
##'  f_bbob2009_06_14 f_bbob2009_06_15 f_bbob2009_07_01 f_bbob2009_07_02
##'  f_bbob2009_07_03 f_bbob2009_07_04 f_bbob2009_07_05 f_bbob2009_07_06
##'  f_bbob2009_07_07 f_bbob2009_07_08 f_bbob2009_07_09 f_bbob2009_07_10
##'  f_bbob2009_07_11 f_bbob2009_07_12 f_bbob2009_07_13 f_bbob2009_07_14
##'  f_bbob2009_07_15 f_bbob2009_08_01 f_bbob2009_08_02 f_bbob2009_08_03
##'  f_bbob2009_08_04 f_bbob2009_08_05 f_bbob2009_08_06 f_bbob2009_08_07
##'  f_bbob2009_08_08 f_bbob2009_08_09 f_bbob2009_08_10 f_bbob2009_08_11
##'  f_bbob2009_08_12 f_bbob2009_08_13 f_bbob2009_08_14 f_bbob2009_08_15
##'  f_bbob2009_09_01 f_bbob2009_09_02 f_bbob2009_09_03 f_bbob2009_09_04
##'  f_bbob2009_09_05 f_bbob2009_09_06 f_bbob2009_09_07 f_bbob2009_09_08
##'  f_bbob2009_09_09 f_bbob2009_09_10 f_bbob2009_09_11 f_bbob2009_09_12
##'  f_bbob2009_09_13 f_bbob2009_09_14 f_bbob2009_09_15 f_bbob2009_10_01
##'  f_bbob2009_10_02 f_bbob2009_10_03 f_bbob2009_10_04 f_bbob2009_10_05
##'  f_bbob2009_10_06 f_bbob2009_10_07 f_bbob2009_10_08 f_bbob2009_10_09
##'  f_bbob2009_10_10 f_bbob2009_10_11 f_bbob2009_10_12 f_bbob2009_10_13
##'  f_bbob2009_10_14 f_bbob2009_10_15 f_bbob2009_11_01 f_bbob2009_11_02
##'  f_bbob2009_11_03 f_bbob2009_11_04 f_bbob2009_11_05 f_bbob2009_11_06
##'  f_bbob2009_11_07 f_bbob2009_11_08 f_bbob2009_11_09 f_bbob2009_11_10
##'  f_bbob2009_11_11 f_bbob2009_11_12 f_bbob2009_11_13 f_bbob2009_11_14
##'  f_bbob2009_11_15 f_bbob2009_12_01 f_bbob2009_12_02 f_bbob2009_12_03
##'  f_bbob2009_12_04 f_bbob2009_12_05 f_bbob2009_12_06 f_bbob2009_12_07
##'  f_bbob2009_12_08 f_bbob2009_12_09 f_bbob2009_12_10 f_bbob2009_12_11
##'  f_bbob2009_12_12 f_bbob2009_12_13 f_bbob2009_12_14 f_bbob2009_12_15
##'  f_bbob2009_13_01 f_bbob2009_13_02 f_bbob2009_13_03 f_bbob2009_13_04
##'  f_bbob2009_13_05 f_bbob2009_13_06 f_bbob2009_13_07 f_bbob2009_13_08
##'  f_bbob2009_13_09 f_bbob2009_13_10 f_bbob2009_13_11 f_bbob2009_13_12
##'  f_bbob2009_13_13 f_bbob2009_13_14 f_bbob2009_13_15 f_bbob2009_14_01
##'  f_bbob2009_14_02 f_bbob2009_14_03 f_bbob2009_14_04 f_bbob2009_14_05
##'  f_bbob2009_14_06 f_bbob2009_14_07 f_bbob2009_14_08 f_bbob2009_14_09
##'  f_bbob2009_14_10 f_bbob2009_14_11 f_bbob2009_14_12 f_bbob2009_14_13
##'  f_bbob2009_14_14 f_bbob2009_14_15 f_bbob2009_15_01 f_bbob2009_15_02
##'  f_bbob2009_15_03 f_bbob2009_15_04 f_bbob2009_15_05 f_bbob2009_15_06
##'  f_bbob2009_15_07 f_bbob2009_15_08 f_bbob2009_15_09 f_bbob2009_15_10
##'  f_bbob2009_15_11 f_bbob2009_15_12 f_bbob2009_15_13 f_bbob2009_15_14
##'  f_bbob2009_15_15 f_bbob2009_16_01 f_bbob2009_16_02 f_bbob2009_16_03
##'  f_bbob2009_16_04 f_bbob2009_16_05 f_bbob2009_16_06 f_bbob2009_16_07
##'  f_bbob2009_16_08 f_bbob2009_16_09 f_bbob2009_16_10 f_bbob2009_16_11
##'  f_bbob2009_16_12 f_bbob2009_16_13 f_bbob2009_16_14 f_bbob2009_16_15
##'  f_bbob2009_17_01 f_bbob2009_17_02 f_bbob2009_17_03 f_bbob2009_17_04
##'  f_bbob2009_17_05 f_bbob2009_17_06 f_bbob2009_17_07 f_bbob2009_17_08
##'  f_bbob2009_17_09 f_bbob2009_17_10 f_bbob2009_17_11 f_bbob2009_17_12
##'  f_bbob2009_17_13 f_bbob2009_17_14 f_bbob2009_17_15 f_bbob2009_18_01
##'  f_bbob2009_18_02 f_bbob2009_18_03 f_bbob2009_18_04 f_bbob2009_18_05
##'  f_bbob2009_18_06 f_bbob2009_18_07 f_bbob2009_18_08 f_bbob2009_18_09
##'  f_bbob2009_18_10 f_bbob2009_18_11 f_bbob2009_18_12 f_bbob2009_18_13
##'  f_bbob2009_18_14 f_bbob2009_18_15 f_bbob2009_19_01 f_bbob2009_19_02
##'  f_bbob2009_19_03 f_bbob2009_19_04 f_bbob2009_19_05 f_bbob2009_19_06
##'  f_bbob2009_19_07 f_bbob2009_19_08 f_bbob2009_19_09 f_bbob2009_19_10
##'  f_bbob2009_19_11 f_bbob2009_19_12 f_bbob2009_19_13 f_bbob2009_19_14
##'  f_bbob2009_19_15 f_bbob2009_20_01 f_bbob2009_20_02 f_bbob2009_20_03
##'  f_bbob2009_20_04 f_bbob2009_20_05 f_bbob2009_20_06 f_bbob2009_20_07
##'  f_bbob2009_20_08 f_bbob2009_20_09 f_bbob2009_20_10 f_bbob2009_20_11
##'  f_bbob2009_20_12 f_bbob2009_20_13 f_bbob2009_20_14 f_bbob2009_20_15
##'  f_bbob2009_21_01 f_bbob2009_21_02 f_bbob2009_21_03 f_bbob2009_21_04
##'  f_bbob2009_21_05 f_bbob2009_21_06 f_bbob2009_21_07 f_bbob2009_21_08
##'  f_bbob2009_21_09 f_bbob2009_21_10 f_bbob2009_21_11 f_bbob2009_21_12
##'  f_bbob2009_21_13 f_bbob2009_21_14 f_bbob2009_21_15 f_bbob2009_22_01
##'  f_bbob2009_22_02 f_bbob2009_22_03 f_bbob2009_22_04 f_bbob2009_22_05
##'  f_bbob2009_22_06 f_bbob2009_22_07 f_bbob2009_22_08 f_bbob2009_22_09
##'  f_bbob2009_22_10 f_bbob2009_22_11 f_bbob2009_22_12 f_bbob2009_22_13
##'  f_bbob2009_22_14 f_bbob2009_22_15 f_bbob2009_23_01 f_bbob2009_23_02
##'  f_bbob2009_23_03 f_bbob2009_23_04 f_bbob2009_23_05 f_bbob2009_23_06
##'  f_bbob2009_23_07 f_bbob2009_23_08 f_bbob2009_23_09 f_bbob2009_23_10
##'  f_bbob2009_23_11 f_bbob2009_23_12 f_bbob2009_23_13 f_bbob2009_23_14
##'  f_bbob2009_23_15 f_bbob2009_24_01 f_bbob2009_24_02 f_bbob2009_24_03
##'  f_bbob2009_24_04 f_bbob2009_24_05 f_bbob2009_24_06 f_bbob2009_24_07
##'  f_bbob2009_24_08 f_bbob2009_24_09 f_bbob2009_24_10 f_bbob2009_24_11
##'  f_bbob2009_24_12 f_bbob2009_24_13 f_bbob2009_24_14 f_bbob2009_24_15
##'
##' @rdname f_bbob2009
##' @exportPattern "f_bbob2009.*"
f_bbob2009 <- function(x, fid, iid)
  .Call(do_bbob_eval, as.integer(fid), as.integer(iid), x)

for (fid in 1:24) {
  for (iid in 1:15) {
    name <- sprintf("f_bbob2009_%02i_%02i", fid, iid)
    f <- function(x) {}
    body(f) <- substitute(.Call(do_bbob_eval, fid, iid, x),
                          list(fid=fid, iid=iid))
    attr(f, "fid") <- fid
    attr(f, "iid") <- iid
    class(f) <- c("bbob2009_function", "soo_function")
    assign(name, f)
    rm(f)
  }
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
##' @param ... Ignored.
##' @return Global minimum.
##' @S3method global_minimum bbob2009_function
##' @method global_minimum bbob2009_function
global_minimum.bbob2009_function <- function(x, dim, ...) {
  fid <- attr(x, "fid")
  iid <- attr(x, "iid")
  l <- .Call(do_bbob_opt,
             as.integer(fid), as.integer(iid), as.integer(dim))
  names(l) <- c("par", "value")
  l
}

##' @S3method function_name bbob2009_function
##' @method function_name bbob2009_function
##' @rdname function_name.Rd
function_name.bbob2009_function <- function(x, ...) {
  fid <- attr(x, "fid")
  iid <- attr(x, "iid")
  sprintf("BBOB 2009 test function Nr. %i (instance %i)", fid, iid)
}


##' @S3method function_id bbob2009_function
##' @method function_id bbob2009_function
##' @rdname function_id.Rd
function_id.bbob2009_function <- function(x, ...) {
  fid <- attr(x, "fid")
  iid <- attr(x, "iid")
  sprintf("bbob2009_%02i_%02i", fid, iid)
}
