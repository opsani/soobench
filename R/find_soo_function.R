find_soo_functions <- function(qexpr, env=parent.frame()) {
  recursive_find <- function(qe, env) {
    if (length(qe) == 0) {
      NULL
    } else if (is.call(qe)) {
      if ("$" == qe[[1]] && is.name(qe[[2]]) && is.name(qe[[3]])) {
        NULL
      } else if (("[[" == qe[[1]] || "[" == qe[[1]]) && is.name(qe[[2]])) {
        c(Recall(qe[[3]], env), Recall(qe[-c(1,2,3)], env))
      } else {
        if (is.name(qe[[1]])
            && as.character(qe[[1]]) != ""
            && exists(as.character(qe[[1]]), envir=env)
            && is_soo_function(get(as.character(qe[[1]]), envir=env))) {
          c(as.character(qe[[1]]), Recall(as.list(qe)[-1], env))
        } else {
          Recall(as.list(qe)[-1], env)
        }
      }
    } else if (is.list(qe)) {
      c(Recall(qe[[1]], env), Recall(qe[-1], env))
    } else if (is.name(qe)
               && as.character(qe) != ""
               && exists(as.character(qe), envir=env)
               && is_soo_function(get(as.character(qe), envir=env))) {
      c(as.character(qe))
    } else {
      NULL
    }
  }
  ## Return each function only once and sort them alphabetically
  sort(unique(recursive_find(qexpr, env)))
}
