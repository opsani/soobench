#todo: xlim only works for soobench funs
#todo: add parameter to log z values, include log base 
#todo: plot global minimum for soobench funs 

##' Plot a test function in 2D.
##'
##' @param f Function to plot.
##' @param xlim Limit of x1.
##' @param ylim Limit of x2.
##' @param n Number of places to sample the function.
##' @param image.args List of further arguments passed to image().
##' @param contour.args List of further arguments passed to contour().
##' @export
plot_2dfunction <- function(f, 
  xlim=c(lower_bounds(f, dim=2)[1], upper_bounds(f, dim=2)[1]),  
  ylim=c(lower_bounds(f, dim=2)[2], upper_bounds(f, dim=2)[2]),  
  n=1024, 
  image.args=list(col=terrain.colors(200), xlab=expression(x[1]), ylab=expression(x[2])),
  contour.args = list()) {
  
  k <- floor(sqrt(n))
  x1 <- seq(xlim[1], xlim[2], length.out=k)
  x2 <- seq(ylim[1], ylim[2], length.out=k)
  X <- expand.grid(x1, x2)
  y <- apply(X, 1, f)
  dim(y) <- c(k, k)
  do.call(image, append(list(x=x1, y=x2, z=y), image.args))
  do.call(contour, append(list(x=x1, y=x2, z=y, add=TRUE), contour.args))
}
