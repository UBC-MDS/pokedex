#' Get available types for given API parameter
#'
#' @param type -- API query type of interest
#' @param limit -- the max. number of \code{type}'s to return
#'
#' @return The types that the API will recognize.
#' @examples
#' get_types(type = "generation")
#'
#' @import httr
#' @import purrr
#' @importFrom magrittr "%>%"
#'
#' @export
get_types <- function(type, limit = 10) {

  query <- paste0("http://pokeapi.co/api/v2/", type, "?limit=", limit)
  resp <- httr::GET(query)
  con <- httr::content(resp)

  if (resp$status_code == 404) stop("The API does not recognize that type!")

  out <- con$results %>% purrr::map_chr(`[[`, "name")
  return(out)
}

