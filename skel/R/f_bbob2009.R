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
  stopifnot(fid < 25)
  iid <- as.integer(iid)
  opt <- .Call(do_bbob_opt, fid, iid, as.integer(dimensions))
  f <- function(x) {}
  body(f) <- substitute(.Call(do_bbob_eval, fid, iid, x),
                        list(fid=fid, iid=iid))
  
  soo_function(name=sprintf("BBOB 2009 problem %i (instance %i)", fid, iid),
               id=sprintf("bbob2009-%02i-%02i-%id", fid, iid, dimensions),
               fun=f,
               dimensions=dimensions,
               lower_bounds=rep(-5, dimensions),
               upper_bounds=rep(5, dimensions),
               best_par=opt[[1]],
               best_value=opt[[2]])
}

##' Noisy BBOB 2009 test function generator.
##'
##' @param dimensions Size of parameter space.
##' @param fid Function ID.
##' @param iid Instance ID, defaults to \code{1L}.
##' @param noiseSeed Seed for noise generator, defaults to current
##'   time in seconds since 1970-01-01.
##'
##' @note If you use several noisy BBOB functions at the same time
##' they will share a noise generator. This may make your results
##' non-repeatable. You have been warned.
##'
##' Note that the optimal parameter setting is currently not
##' available.
##' 
##' @return A \code{soo_function}.
##' @export
##' @useDynLib soobench do_bbob_opt do_bbob_eval do_set_bbob_noise_seed
noisy_bbob2009_function <- function(dimensions, fid, iid, noiseSeed) {
  fid <- as.integer(fid)
  realfid <- 100L + fid
  stopifnot(100 < realfid, realfid < 125)
  iid <- as.integer(iid)
  .Call(do_set_bbob_noise_seed, as.integer(noiseSeed))
  opt <- .Call(do_bbob_opt, realfid, iid, as.integer(dimensions))
  f <- function(x) {}
  body(f) <- substitute(.Call(do_bbob_eval, fid, iid, x),
                        list(fid=realfid, iid=iid))
  
  soo_function(name=sprintf("Noisy BBOB 2009 problem %i (instance %i)", fid, iid),
               id=sprintf("noisy-bbob2009-%02i-%02i-%id", fid, iid, dimensions),
               fun=f,
               dimensions=dimensions,
               lower_bounds=rep(-5, dimensions),
               upper_bounds=rep(5, dimensions),
               best_par=rep(NA, length(opt[[1]])),
               best_value=opt[[2]])
}
