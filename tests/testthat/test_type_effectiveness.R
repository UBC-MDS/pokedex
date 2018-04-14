library(pokedex)

st_df <- data.frame(c("steel", "fire", "water", "ice"))
wt_df <-data.frame(c("grass", "electric"))
sa_df <- data.frame(c("ground", "rock", "fire"))
wa_df <- data.frame(c("water", "grass", "dragon"))

names(st_df) <- c("Strong To")
names(wt_df) <- c("Weak To")
names(sa_df) <- c("Strong Against")
names(wa_df) <- c("Weak Against")

test_that("type_effectiveness(type, strength, direction)", {
  expect_equal(type_effectiveness("water", "strong", "to"), st_df)
  expect_equal(type_effectiveness("water", "weak", "to"), wt_df)
  expect_equal(type_effectiveness("water", "strong", "against"), sa_df)
  expect_equal(type_effectiveness("water", "weak", "against"), wa_df)
  expect_equal(type_effectiveness("not a type", "weak", "against"), FALSE)
  expect_equal(type_effectiveness("water", "not a stength", "against"), FALSE)
  expect_equal(type_effectiveness("water", "weak", "not a direction"), FALSE)
})
