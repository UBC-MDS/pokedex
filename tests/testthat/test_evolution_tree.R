bulb_df <- data.frame(name = c("ivysaur", "venusaur"), trigger = c("level up", "level up"), level = c(16, 32))

test_that("evolution_tree(name_val)", {
  expect_equal(evolution_tree("bulbasaur"), bulb_df)
  expect_error(evolution_tree(1234))
})
