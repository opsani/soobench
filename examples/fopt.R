library("soobench")

bbob_minimum <- function(fid, iid, dim=2) {
  l <- .Call("do_bbob_opt", as.integer(fid), as.integer(iid), as.integer(dim))
  names(l) <- c("par", "value")
  l
}

for (fid in 1:24) {
  for (iid in 1:15) {
    opt <- bbob_minimum(fid, iid)
    f_value <- f_bbob2009(opt$par, fid, iid)
    
    if (abs(f_value - opt$value) > 1e-8) {
      message(sprintf("f_%02i_%02i: delta=%f", fid, iid, abs(f_value - opt$value)))
    }
  }
}
