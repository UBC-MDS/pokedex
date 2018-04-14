bulb_df <- data.frame(name = c("ivysaur", "venusaur"), trigger = c("level-up", "level-up"), level = c(16, 32))

squirt_df <- data.frame(name = c("wartortle", "blastoise"), trigger=c("level-up", "level-up"), level=c(16,36))

char_df <- data.frame(name=c("charmeleon", "charizard"),trigger=c("level-up", "level-up"), level=c(16,36))

eevee_df <- data.frame(name=c("vaporeon", "jolteon", "flareon", "espeon", "umbreon", "leafeon", "glaceon", "sylveon"),
                       trigger = c("use-item", "use-item", "use-item", "level-up", "level-up", "level-up", "level-up", "level-up"))

test_that("evolution_tree(name_val)", {
  expect_equal(evolution_tree("bulbasaur"), bulb_df)
  expect_equal(evolution_tree("squirtle"), squirt_df)
  expect_error(evolution_tree(1234))
  expect_error(evolution_tree("ivysaur"))
  expect_equal(evolution_tree("charmander"), char_df)
  expect_equal(evolution_tree("eevee"), eevee_df)
})
