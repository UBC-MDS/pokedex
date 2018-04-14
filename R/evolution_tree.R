#' Evolution Tree
#'
#' Get the evolution tree of a pokemon character in a data frame
#' Note: this version only creates evolution trees for babies
#'
#' @param name_val The name of a Pokemon character, a string
#'
#' @importFrom magrittr '%>%'
#' @import httr
#' @import dplyr
#' @return A data frame containing the names of the characters the name_val evolves into, the trigger that causes it, and the minimum level it occurs at
#'
#' @examples
#' evolution_tree("bulbasaur")
#'
#' @export
evolution_tree <- function(name_val){
  ## make sure the pokemon exists in the evolution chain api
  tryCatch({
    exists <- pokedex::pokemon_exists(tolower(name_val))
    if(!exists){
      stop("Error: Pokemon does not exist. Please reference documentation for pokemon that exist in this API.")
    }
  })

  ## get the id value from the stored evolution chain ids
  tryCatch({
    data("evolution_chain")
    evolution_chain_ids$name <- as.character(evolution_chain_ids$name)
    id_val <- evolution_chain_ids %>% dplyr::filter(name == name_val) %>% .$id
  })

  ## call the evolution api for that id
  url <- paste("http://pokeapi.co/api/v2/evolution-chain/", id_val, sep="")
  r <- httr::GET(url)
  r2 <- httr::content(r)

  ## eevee has 8 different possible evolutions (only character with this trait), so treat it separately
  if(tolower(name_val) == "eevee"){
    names <- c()
    triggers <- c()
    ## loop through to get each of the 8 first level evolution names and triggers
    ## min levels are null values for all of these evolutions, therefore will be excluded
    tr <- lapply(c(1:8), function(x) c(r2$chain$evolves_to[[x]]$species$name, r2$chain$evolves_to[[x]]$evolution_details[[1]]$trigger$name))

    ## put the names and triggers in a list to make creating a data frame easy
    for(i in c(1:8)){
      names <- c(names, unlist(tr[i])[1])
      triggers <- c(triggers, unlist(tr[i])[2])
    }

    ## make the eevee data frame and return it
    eevee_df <- data.frame(name = names, trigger = triggers)
    return(eevee_df)
  }

  ## get the levels for the first and second evolutions (there are only two evolutions for baby characters)
  first <- r2$chain$evolves_to[[1]]
  second <- r2$chain$evolves_to[[1]]$evolves_to[[1]]

  ## prepare to store in data frame
  ## df will have names, trigger and level of trigger columns
  names <- c(first$species$name, second$species$name)
  trigger <- c(first$evolution_details[[1]]$trigger$name, second$evolution_details[[1]]$trigger$name)
  trigger_level <- c(first$evolution_details[[1]]$min_level, second$evolution_details[[1]]$min_level)

  df <- data.frame(name = names, trigger = trigger, level = trigger_level)
  return(df)
}
