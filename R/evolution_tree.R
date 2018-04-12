#' Title
#'
#' @param name_val
#'
#' @importFrom magittr '%>%'
#' @importFrom pokedex find_ev_id
#' @importFrom pokedex pokemon_exists
#' @import httr
#' @import dplyr
#' @return
#' @export
#'
#' @examples

evolution_tree <- function(name_val){
  ## make sure the pokemon exists by reference stored data frame of list of pokemon in api
  tryCatch({
    exists <- pokemon_exists(tolower(name_val))
    if(!exists){
      stop("Error: Pokemon does not exist. Please reference documentation for pokemon that exist in this API.")
    }
  })

  ## search the evolution api for the id value
  tryCatch({
    print("Searching API.... This might take a moment.")
    id <- find_ev_id(tolower(name_val))
  })

  ## call the evolution api for that id
  url <- paste("http://pokeapi.co/api/v2/evolution-chain/", id, sep="")
  r <- httr::GET(url)
  r2 <- httr::content(r)
  first <- r2$chain$evolves_to[[1]]
  second <- r2$chain$evolves_to[[1]]$evolves_to[[1]]

  names <- c(first$species$name, second$species$name)
  trigger <- c(first$evolution_details[[1]]$trigger$name, second$evolution_details[[1]]$trigger$name)
  trigger_level <- c(first$evolution_details[[1]]$min_level, second$evolution_details[[1]]$min_level)

  df <- data.frame(name = names, trigger = trigger, level = trigger_level)
  return(df)
}
