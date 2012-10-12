validate_generator <- function(g) {
  expect_true(inherits(g, "soo_function_generator"))
  attribute_names <- names(attributes(g))
  expect_true("id" %in% attribute_names)
  expect_true("name" %in% attribute_names)
}

validate_generator(generate_ackley_function)
validate_generator(generate_sphere_function)
