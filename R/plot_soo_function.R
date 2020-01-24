#' Plot a test function in 1 or 2 dimensions.
#'
#' @param x [\code{\link{soo_function}}] Function to plot.
#' @param ... Passed to the respective plot function.
#'
#' @examples
#' par(mfrow=c(2, 2))
#' fn <- generate_sphere_function(2)
#' plot(fn)
#' plot(fn, show="contour")
#' plot(fn, rank=TRUE)
#' plot(fn, log=TRUE)
#' @author Olaf Mersmann \email{olafm@@p-value.net}
#' @export
#' @method plot soo_function
#' @export
plot.soo_function <- function(x, ...) {
  stopifnot(number_of_parameters(x) <= 2)
  
  if (number_of_parameters(x) == 1) {
    plot_1d_soo_function(x, ...)
  } else {
    plot_2d_soo_function(x, ...)
  }
}

#' Plot a test function in 1D.
#'
#' @param fn [\code{\link{soo_function}}] Function to plot.
#' @param lower [\code{numeric}] Lower bounds of x1 and x2.
#' @param upper [\code{numeric}] Upper bounds of x1 and x2.
#' @param n [\code{integer(1)}] Number of locations at which to sample the function.
#' @param xlab [\code{character(1)}] Label of x (x1) axes.
#' @param ylab [\code{character(1)}] Label of y (x2) axes.
#' @param main [\code{character(1)}] Main title of plot.
#' @param log [\code{boolean(1)}] If \code{TRUE}, the z axes is plotted on log scale.
#' @param rank [\code{boolean(1)}] If \code{TRUE}, instead of the y values, their ranks are drawn.
#' @param ... Ignored.
#' 
#' @author Olaf Mersmann \email{olafm@@p-value.net}
#' @export
plot_1d_soo_function <- function(fn,
                                 lower=lower_bounds(fn),
                                 upper=upper_bounds(fn),
                                 n=1001L,
                                 xlab, ylab,
                                 main=function_name(fn),
                                 log=FALSE, rank=FALSE,
                                 ...) {
  stopifnot(number_of_parameters(fn) == 1,
            n == as.integer(n))
  X <- matrix(seq(lower, upper, length.out=n), nrow=1)
  z <- fn(X)
  ## Generate pretty labels
  if (missing(xlab))
    xlab <- expression(x)
  if (missing(ylab)) {
    if (log & rank) {
      ylab <- expression(log(rank(f(x))))
    } else if (log) {
            ylab <- expression(log(f(x)))
    } else if (rank) {
      ylab <- expression(rank(f(x)))
    } else {
      ylab <- expression(f(x))
    }
  }
  if (log) {
    ## Ooops, some below zero. Lets fix that.
    if (any(z < 0)) {
      warning("Negative function values. Shifting function to apply logarithm.")
      z <- z - min(z) + 1
    }
    z <- log(z)
  }
  
  if (rank)
    z <- rank(z)
  plot(drop(X), z, xlab=xlab, ylab=ylab, type="l", main=main)
}


#' Plot a test function in 2D.
#'
#' @param fn [\code{\link{soo_function}}] Function to plot.
#' @param lower [\code{numeric}] Lower bounds of x1 and x2.
#' @param upper [\code{numeric}] Upper bounds of x1 and x2.
#' @param n [\code{integer(1)}] Number of locations at which to sample the function.
#' @param xlab [\code{character(1)}] Label of x (x1) axes.
#' @param ylab [\code{character(1)}] Label of y (x2) axes.
#' @param main [\code{character(1)}] Main title of plot.
#' @param log [\code{boolean(1)}] If \code{TRUE}, the z axes is plotted on log scale.
#' @param rank [\code{boolean(1)}] If \code{TRUE}, instead of the y values, their ranks are drawn.
#' @param show [\code{character}] A vector of parts to plot. Defaults to
#'   \code{c("image", "contour")} and can be any subset.
#' @param asp [\code{numeric(1)}] Aspect ratio of plot. Defaults to \code{1}.
#' @param ... Ignored.
#' @param image_args [\code{list}] List of further arguments passed to image().
#' @param contour_args [\code{list}] List of further arguments passed to contour().
#'
#' @examples
#' par(mfrow=c(2, 2))
#' fn <- generate_sphere_function(2)
#' plot(fn)
#' plot(fn, show="contour")
#' plot(fn, rank=TRUE)
#' plot(fn, log=TRUE)
#' @author Olaf Mersmann \email{olafm@@p-value.net}
#' @export
plot_2d_soo_function <- function(fn,
                                 lower=lower_bounds(fn),
                                 upper=upper_bounds(fn),
                                 n=10000L,
                                 main=function_name(fn),
                                 xlab=expression(x[1]),
                                 ylab=expression(x[2]),
                                 log=FALSE, rank=FALSE, asp=1,
                                 show=c("image", "contour"),
                                 image_args=list(useRaster=TRUE),
                                 contour_args=list()) {
  stopifnot(number_of_parameters(fn) == 2,
            is.list(image_args),
            is.list(contour_args),
            n == as.integer(n))
  
  breaks_per_axis <- floor(sqrt(n))
  x1 <- seq(lower[1], upper[1], length.out=breaks_per_axis)
  x2 <- seq(lower[2], upper[2], length.out=breaks_per_axis)
  X <- expand.grid(x1, x2)
  z <- apply(X, 1, fn)
  
  ## Shoud we logarithm the function values?
  if (log) {
    ## Ooops, some below zero. Lets fix that.
    if (any(z < 0)) {
      warning("Negative function values. Shifting function to apply logarithm.")
      z <- z - min(z) + 1
    }
    z <- log(z)
  }
  
  if (rank)
    z <- rank(z)
  
  ## Make z a breaks_per_axis times breaks_per_axis matrix:
  dim(z) <- c(breaks_per_axis, breaks_per_axis)
  
  ## Fixup image_args:
  if (!"col" %in% names(image_args))
    image_args$col <- terrain.colors(255)
  
  ## Plot image:
  if ("image" %in% show) {
    image_args <- append(list(x=x1, y=x2, z=z, xlab=xlab, ylab=ylab,
                              main=main, asp=asp),
                         image_args)
    do.call(image, image_args)
  }
  ## Plot contour:
  if ("contour" %in% show) {    
    contour_args <- append(list(x=x1, y=x2, z=z, asp=asp), contour_args)
    ## If we did not plot an image, fixup contour args to include axis
    ## labels and plot title:
    if (!"image" %in% show)
      contour_args <- append(contour_args,
                             list(xlab=xlab, ylab=ylab, main=main))
    else
      contour_args$add <- TRUE
    do.call(contour, contour_args)
  }
}
