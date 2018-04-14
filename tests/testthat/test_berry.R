library(pokedex)
library(testthat)
library(tibble)

test_that("Berry that isn't in the database will return an error", {
  expect_error(get_berry("blueberry"), "That berry is not in the PokeAPI database.")
})

test_that("Correct dataframe is returned by function.", {

  df <- tibble(
    Name="cheri",
    `Growth Time` = as.integer(3),
    Size = as.integer(20),
    Firmness = "soft")

  expect_identical(df, get_berry("cheri"))
})
