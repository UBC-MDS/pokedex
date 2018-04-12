#' Get region for given game colour (version)
#'
#' @param colour -- the game colour that we seek the region for.
#' @param url -- whether or not to return a url to from another query to API.
#'
#' @return The region where \code{colour} game took place or a \code{url} to query API.
#' @examples
#' get_region(colour = "sapphire")
#' get_region(colour = "red", url = TRUE)
#'
#' @import httr
#' @import purrr
#' @importFrom magrittr "%>%"
#'
#' @export
get_region <- function(colour, url = FALSE) {

  resp <- httr::GET(paste0("http://pokeapi.co/api/v2/version/", colour))
  con <- httr::content(resp)

  if (resp$status_code == 404) {
      cols <- pokedex::get_types(type = "version")
      stop("Colour not found. Make sure it is one of: ", paste0(cols, collpase =", "))
  }

  r <- con$version_group$url %>%
    httr::GET() %>%
    httr::content()

  out <- ifelse(url, r$regions[[1]]$url, r$regions[[1]]$name)
  return(out)
}
