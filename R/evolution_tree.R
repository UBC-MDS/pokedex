#' Evolution Tree
#'
#' Get the evolution tree of a pokemon character in a data frame
#'
#' @param name_val
#'
#' @importFrom magrittr '%>%'
#' @import httr
#' @import dplyr
#' @return
#'
#' @examples
#'
#' @export
evolution_tree <- function(name_val){
  ## make sure the pokemon exists by reference stored data frame of list of pokemon in api
  tryCatch({
    exists <- pokedex::pokemon_exists(tolower(name_val))
    if(!exists){
      stop("Error: Pokemon does not exist. Please reference documentation for pokemon that exist in this API.")
    }
  })

  ## get the id value
  tryCatch({
    data("evolution_chain")
    evolution_chain_ids$name <- as.character(evolution_chain_ids$name)
    id_val <- evolution_chain_ids %>% filter(name == name_val) %>% .$id
  })
  ## search the evolution api for the id value

  ## call the evolution api for that id
  url <- paste("http://pokeapi.co/api/v2/evolution-chain/", id_val, sep="")
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
