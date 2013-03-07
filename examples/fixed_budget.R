library("soobench")

fn <- generate_rosenbrock_function(2)
fn <- fixed_budget_function(fn, 110)
fn <- record_target_values_function(fn)

par <- random_parameter(fn)
r <- tryCatch(optim(par, fn), method="BFGS",
              ## Ignore 'evaluation_limit_error's
              evaluation_limit_error=function(cond) NULL,
              error=function(cond) cond)
fht <- first_hitting_times(fn, 10^(5:(-8)))
print(fht)

