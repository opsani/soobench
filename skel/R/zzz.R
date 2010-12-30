.onAttach <- function(libname, pkgname) {
  ##packageStartupMessage("Loading package soobench r", packageVersion(pkgname, lib.loc=libname))
  packageStartupMessage("soobench> ATTENTION:
soobench> This package is meant for internal use only. Distribution outside the
soobench> TU Dortmund is strongly discouraged. Some of the included C source
soobench> codes licencing situation is not clear w.r.t. outside distribution.")
  TRUE
}
