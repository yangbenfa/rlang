context("symbols")

test_that("can ensym() at top-level", {
  expect_identical(eval_bare(quote(ensym(foo)), global_env()), quote(foo))
})

test_that("ensym() fails with calls", {
  capture_sym <- function(arg) ensym(arg)
  expect_identical(capture_sym(foo), quote(foo))
  expect_error(capture_sym(foo(bar)), "Must supply a symbol")
})
