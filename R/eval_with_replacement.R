eval_with_replacement <- function(quoted_expr, env, bindings) {
  magic_env <- new.env(parent=env)
  for (bn in names(bindings))
    magic_env[[bn]] <- bindings[[bn]]

  res <- eval(quoted_expr, envir=magic_env)

  ## Now copy any new objects from our magic_env into the parent environemnt.
  for (nm in ls(envir=magic_env)) {
    if (! nm %in% names(bindings)) {
      env[[nm]] <- magic_env[[nm]]
    } else {
      ## Could try to figure out if value of binding changed and then
      ## possible copy it out into the parent environment. Skipping
      ## for now.
    }
  }
  ## Now we can return the result of the evaluation
  res
}
