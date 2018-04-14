#' Get region and generation for given game colour (version).
#'
#' @param colour -- the game colour that we seek the region for.
#'
#' @return A tibble containg game \code{colour}, region, and generation.
#' @examples
#' get_region(colour = "sapphire")
#'
#' @import httr
#' @import purrr
#' @import tibble
#' @importFrom magrittr "%>%"
#'
#' @export
get_region <- function(colour) {

  resp <- httr::GET(paste0("http://pokeapi.co/api/v2/version/", colour))
  con <- httr::content(resp)

  if (resp$status_code == 404) {
      cols <- pokedex::get_types(type = "version")
      stop("Colour not found. Make sure it is one of: ", paste0(cols, collpase =", "))
  }

  r <- con$version_group$url %>%
    httr::GET() %>%
    httr::content()

  out <- tibble::tibble(
    game = colour,
    region = ifelse(is_empty(r$region), NA, r$regions[[1]]$name),
    generation = r$generation$name
  )
  return(out)
}
