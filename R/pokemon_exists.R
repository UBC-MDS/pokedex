#' Tests whether the pokemon is available in the API by comparing to a stored data frame
#
#' @title Test pokemon exists
#' @param name Name of pokemon
#' @return Boolean TRUE if the pokemon exists in the API, FALSE otherwise
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
