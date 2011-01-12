##' Plot a test function in 2D.
##'
##' @param f Function to plot.
##' @param xlim Limit of x1.
##' @param ylim Limit of x2.
##' @param n Number of places to sample the function.
##' @param ... Further arguments passed to contour().
##' @export
plot_2dfunction <- function(f, xlim, ylim, n=1024, ...) {
  k <- floor(sqrt(n))
  x1 <- seq(xlim[1], xlim[2], length.out=k)
  x2 <- seq(ylim[1], ylim[2], length.out=k)
  X <- expand.grid(x1, x2)
  y <- apply(X, 1, f)
  dim(y) <- c(k, k)
  image(x1, x2, y, col=terrain.colors(200))
  contour(x1, x2, y, add=TRUE, ...)
}
