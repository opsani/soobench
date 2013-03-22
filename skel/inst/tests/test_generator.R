validate_generator <- function(g) {
  context(deparse(substitute(g)))
  test_that("Is a valid generator",
            expect_true(inherits(g, "soo_function_generator")))
  test_that("Has a name and id", {
    attribute_names <- names(attributes(g))
    expect_true("id" %in% attribute_names)
    expect_true("name" %in% attribute_names)
  })
}

validate_generator(generate_ackley_function)
validate_generator(generate_beale_function)
validate_generator(generate_branin_function)
validate_generator(generate_bbob2009_function)
validate_generator(generate_double_sum_function)
validate_generator(generate_ellipsoidal_function)
validate_generator(generate_goldstein_price_function)
validate_generator(generate_griewank_function)
validate_generator(generate_himmelblau_function)
validate_generator(generate_kotanchek_function)
validate_generator(generate_mexican_hat_function)
validate_generator(generate_rastrigin_function)
validate_generator(generate_rosenbrock_function)
validate_generator(generate_sphere_function)
validate_generator(generate_weierstrass_function)
