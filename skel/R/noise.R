##' Add normal noise to a test function.
##'
##' @param f Test function.
##' @param sd Standard deviation of the noise.
##' @return A noisy version of \code{f}.
##' @export
add_normal_noise <- function(f, sd=1) {
  stopifnot(is.function(f))
  force(sd)
  .tmp <- function(x, ...)
    f(x, ...) + rnorm(1, mean=0, sd=sd)
  class(.tmp) <- "normal_noise_function"
  .tmp
}

##' @S3method lower_bounds normal_noise_function
##' @method lower_bounds normal_noise_function
##' @rdname bounds.Rd
lower_bounds.normal_noise_function <- function(x, dim)
  lower_bounds(environment(x)$f, dim)

##' @S3method upper_bounds normal_noise_function
##' @method upper_bounds normal_noise_function
##' @rdname bounds.Rd
upper_bounds.normal_noise_function <- function(x, dim)
  upper_bounds(environment(x)$f, dim)

##' @S3method global_minimum normal_noise_function
##' @method global_minimum normal_noise_function
##' @rdname global_minimum.Rd
global_minimum.normal_noise_function <- function(x, dim, ...)
  global_minimum(environment(x)$f, dim, ...)

##' @method function_name normal_noise_function
##' @S3method function_name normal_noise_function
##' @rdname function_name.Rd
function_name.normal_noise_function <- function(x, ...) {
  name <- function_name(environment(x)$f)
  paste("Normally-noisy", name, sep=" ")
}
  

##' @method function_id normal_noise_function
##' @S3method function_id normal_noise_function
##' @rdname function_id.Rd
function_id.normal_noise_function <- function(x, ...) {
  id <- function_id(environment(x)$f)
  paste(id, "normal_noise", sep="_")
}
  
