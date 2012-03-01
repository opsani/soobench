library("soobench")

f <- double_sum_function(5)
cf <- counting_function(f)

number_of_evaluations(cf)

y <- cf(random_parameters(1, cf))
number_of_evaluations(cf)

y <- cf(random_parameters(10, cf))
number_of_evaluations(cf)

reset_evaluation_counter(cf)
number_of_evaluations(cf)

y <- cf(random_parameters(1, cf))
number_of_evaluations(cf)

y <- cf(random_parameters(10, cf))
number_of_evaluations(cf)
