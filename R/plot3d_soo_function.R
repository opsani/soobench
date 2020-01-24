#' Plot a test function in 3D.
#'
#' @param x Object of type \code{\link{soo_function}} to plot.
#' @param lower Lower bounds of x1 and x2.
#' @param upper Upper bounds of x1 and x2.
#' @param n Number of locations at which to sample the function.
#' @param xlab Label of x (x1) axes.
#' @param ylab Label of y (x2) axes.
#' @param main Main title of plot.
#' @param log If \code{TRUE}, the z axes is plotted on log scale.
#' @param rank If \code{TRUE}, instead of the y values, their ranks are drawn.
#' @param ... Passed to \code{persp3d.default}.
#'
#' par(mfrow=c(1, 3))
#' fn <- generate_sphere_function(2)
#' plot3d(fn)
#' plot3d(fn, log=TRUE)
#' plot3d(fn, rank=TRUE)
#'
#' @author Olaf Mersmann \email{olafm@@datensplitter.net}
#' @importFrom grDevices terrain.colors
plot3d <- function(x,
                  lower=lower_bounds(x),
                  upper=upper_bounds(x),
                  n=10000L,
                  main=function_name(x),
                  xlab=expression(x[1]),
                  ylab=expression(x[2]),
                  log=FALSE,
                  rank=FALSE,
                  ...)
{
  if (!requireNamespace("rgl"))
    stop("plot3d requires the rgl package. Please install it first.")
  stopifnot(n == as.integer(n), number_of_parameters(x) == 2)
  k <- floor(sqrt(n))
  x1 <- seq(lower[1], upper[1], length.out = k)
  x2 <- seq(lower[2], upper[2], length.out = k)
  X <- expand.grid(x1, x2)
  z <- apply(X, 1, x)

  if (log) {
    if (any(z < 0)) {
      warning("Negative function values. Shifting function to apply logarithm.")
      z <- z - min(z) + 1
    }
    z <- log(z)
  }
  if (rank)
    z <- rank(z)
  dim(z) <- c(k, k)
  rgl::persp3d(x1, x2, z,
               xlab=xlab, ylab=ylab, ...,
               main=main,
               color=terrain.colors(200)[cut(z, 200)])
}
