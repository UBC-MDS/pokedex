#' Tests whether the pokemon is available in the API by comparing to a stored data frame
#
#' @title Test pokemon exists
#' @param name Name of pokemon
#' @return Boolean TRUE if the pokemon exists in the API, FALSE otherwise
#' @importFrom magrittr "%>%"
#'
#' @export
pokemon_exists <- function(name_val){
  tryCatch({
         data("evolution_chain")
         evolution_chain_ids$name <- as.character(evolution_chain_ids$name)
  })

  if(!is.character(name_val)){
        return(FALSE)
  }else if(!tolower(name_val) %in% evolution_chain_ids$name){
        return(FALSE)
  }else{
        return(TRUE)
  }
}
