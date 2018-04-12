#' Tests whether the pokemon is available in the API by comparing to a stored data frame
#
#' @title Test pokemon exists
#' @param name Name of pokemon
#' @return Boolean TRUE if the pokemon exists in the API, FALSE otherwise
#'
#' @importfrom magrittr "%>%"
#'
#' @export

pokemon_exists <- function(name){
  tryCatch({
         lookup <- pokedex:::lookup
  })

  if(!is.character(name)){
        return(FALSE)
  }else if(!name %in% lookup$name){
        return(FALSE)
  }else{
        return(TRUE)
  }
}
