library(pokedex)
context("get_types unit testing")

test_that(
  "Correct error thrown when API doesn't recognize type", {
  expect_error(
    get_types(type = "somethingthatdoesntexist"),
    "The API does not recognize that type!"
  )
})

test_that(
  "Correct length vector of recognized values is returned",{
    expect_equal(
      length(get_types(type = "generation", limit = 5)), 
      5
    )
  }
)