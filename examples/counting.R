library("soobench")

f <- generate_double_sum_function(5)
cf <- counting_function(f)

print(number_of_evaluations(cf))

y <- cf(random_parameters(1, cf))
print(number_of_evaluations(cf))

y <- cf(random_parameters(10, cf))
print(number_of_evaluations(cf))

reset_evaluation_counter(cf)
print(number_of_evaluations(cf))

y <- cf(random_parameters(1, cf))
print(number_of_evaluations(cf))

y <- cf(random_parameters(10, cf))
print(number_of_evaluations(cf))
