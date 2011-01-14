##' Plot a test function in 2D.
##'
##' @param f Function to plot.
##' @param lower Lower bounds of x1 and x2.
##' @param upper Upper bounds of x1 and x2.
##' @param n Number of locations at which to sample the function.
##' @param xlab Label of x (x1) axes.
##' @param ylab Label of y (x2) axes.
##' @param main Main title of plot.
##' @param log If \code{TRUE}, the z axes is plotted on log scale.
##' @param image_args List of further arguments passed to image().
##' @param contour_args List of further arguments passed to contour().
##' @S3method plot soo_function
##' @export
plot.soo_function <- function(x,
                              lower=lower_bounds(x, 2),
                              upper=upper_bounds(x, 2),
                              n=10000L,
                              main=function_name(x),
                              xlab=expression(x[1]),
                              ylab=expression(x[2]),
                              log=FALSE,
                              image_args=list(),
                              contour_args=list()) {

  stopifnot(is.list(image_args),
            is.list(contour_args),
            n == as.integer(n))
  k <- floor(sqrt(n))
  x1 <- seq(lower[1], upper[2], length.out=k)
  x2 <- seq(lower[1], upper[2], length.out=k)
  X <- expand.grid(x1, x2)
  z <- apply(X, 1, x)
  dim(z) <- c(k, k)

  ## Shoud we logarithm the function values?
  if (log) {
    ## Ooops, some below zero. Lets fix that.
    if (any(z < 0)) {
      warning("Negative function values. Shifting function to apply logarithm.")
      z <- z - min(z)
    }
    z <- log(z)
  }
  
  ## Fixup image_args:
  if (!"col" %in% names(image_args))
    image_args$col <- terrain.colors(255)

  image_args <- append(list(x=x1, y=x2, z=z, xlab=xlab, ylab=ylab, main=main),
                       image_args)
  contour_args <- append(list(x=x1, y=x2, z=z, add=TRUE), contour_args)
  do.call(image, image_args)
  do.call(contour, contour_args)
}
