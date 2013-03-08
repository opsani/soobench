context("First hitting time")
test_that("first hitting time", {
  expect_equal(first_hitting_times(10:1, 11), 1)
  expect_equal(first_hitting_times(10:1, 10), 1)
  expect_equal(first_hitting_times(10:1, 5), 6)
  expect_equal(first_hitting_times(10:1, 2), 9)
  expect_equal(first_hitting_times(10:1, 1), 10)
  ## OME: OMG, why does the type of NA trip up the test?
  expect_equal(first_hitting_times(10:1, 0), as.numeric(NA))
})
