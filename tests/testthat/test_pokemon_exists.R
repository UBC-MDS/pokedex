test_that("pokemon_exists(name)",{
  expect_equal(pokemon_exists("bulbasaur"), TRUE)
  expect_equal(pokemon_exists("Bulbasaur"), TRUE)
  expect_equal(pokemon_exists("BULBASAUR"), TRUE)
  expect_equal(pokemon_exists("batman"), FALSE)
  expect_equal(pokemon_exists(35), FALSE)
})
