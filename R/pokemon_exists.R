#' Tests whether the pokemon is a baby available in the evolution-chain API by comparing to a stored data frame.
#'
#' This is intended to be used internally.
#
#' @title Test pokemon exists
#' @param name_val Name of pokemon, a string
#' @return Boolean TRUE if the pokemon exists in the evolution-chain API as a baby, FALSE otherwise
#' @importFrom magrittr "%>%"
#'
#' @export
pokemon_exists <- function(name_val){
  ## load in the data
  data("evolution_chain")
  ## name read in as factors, convert to character
  evolution_chain_ids$name <- as.character(evolution_chain_ids$name)

  ## ensure the name is in the evolution chain API
  if(!is.character(name_val)){
        return(FALSE)
  }else if(!tolower(name_val) %in% evolution_chain_ids$name){
        return(FALSE)
  }else{
        return(TRUE)
  }
}
