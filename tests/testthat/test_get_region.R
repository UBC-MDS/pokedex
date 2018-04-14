library(pokedex)
context("get_region unit testing")

test_that(
  "Correct error is thrown when invalid colour is passed", {
    expect_error(
      get_region(colour = "firebrick"),
      "Colour not found. Make sure it is one of: "
    )
  }
)

test_that(
  "String is returned when valid colour is passed", {
    expect_equal(
      is.data.frame(get_region(colour = "red")),
      TRUE
    )
  }
)
