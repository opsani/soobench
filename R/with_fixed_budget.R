#' @title Fixed budget expression evaluation
#'
#' Evaluate \code{expr} with a fixed budget for the number of times
#' any test function in \code{expr} may be evaluated.
#'
#' @param expr [\code{expression}]\cr Expression to evaluate
#'
#' @param budget [\code{integer(1)}]\cr Maximum number of test
#' function evaluations that may be performed by \code{expr}.
#'
#' @details The main use of this function is in benchmarking
#' (optimization) algorithms. It ensures that the algorithm does not
#' perform more than \code{budget} function evaluations by tracking
#' the number of evaluations performed and raising a
#' \code{\link{condition}} if the budget is reached. For this to
#' work, the function must find one and only one \code{soofunction}
#' object in \code{expr} which will be replaced by a modified test
#' function that performs the tracking and signalling.
#'
#' While elegant from a users perspective, this function is not fool
#' proof. It is possible to construct situations were it will
#' fail. For example, if the employed optimization algorithm is
#' written in C and does not use the memory allocation routines
#' provided by R, then this will certainly lead to memory leaks. You have been warned.
#'
#' @return A \code{list} with elements \sQuote{par}, \sQuote{value}
#' and \sQuote{counts} whos contents are identical to the return
#' value of \code{\link{optim}}
#'
#' @examples
#' fn <- generate_sphere_function(10)
#' res <- with_fixed_budget(optim(random_parameter(fn), fn), 25)
#' print(res)
#'
#' @export
with_fixed_budget <- function(expr, budget) {
  stopifnot(is.numeric(budget), budget == as.integer(budget))
  eval_env <- parent.frame()
  quoted_expr <- substitute(expr)
  functions <- find_soo_functions(quoted_expr, eval_env)

  if (length(functions) > 1)
    stop(paste("Found more than one 'soo_function' object in 'expr': ",
               paste("'", functions, "'", sep="", collapse=",")))
  if (length(functions) < 1)
    stop("Did not find any 'soo_function' objects in 'expr'.")

  ## Extract our soo_function:
  function_name <- functions[[1]]
  original_function <- get(function_name, eval_env)

  ## Create fixed budget function:
  count <- 0L
  best_par <- numeric(number_of_parameters(original_function))
  best_value <- Inf
  fn <- function(x, ...) {
    if (count >= budget) {
      ## Raise a custom condition so that we don't mask other stop()
      ## conditions.
      cond <- simpleCondition("Evaluation limit reached.")
      class(cond) <- c("budget_error", class(cond))
      signalCondition(cond)
    }
    count <<- count + 1
    value <- original_function(x, ...)
    if (value < best_value) {
      best_value <<- value
      best_par <<- x
    }
    value
  }
  class(fn) <- c("fixed_budget_function", "wrapped_soo_function")

  ## Evaluate expression with new binding:
  bindings <- list()
  bindings[[function_name]] <- fn

  tryCatch(eval_with_replacement(quoted_expr, eval_env, bindings),
           budget_error=function(...) NULL)

  res <- list(par=best_par, value=best_value, counts=c(count, NA))
}

#' @export
#' @method inner_function fixed_budget_function
inner_function.fixed_budget_function <- function(fn)
  environment(fn)$original_function
