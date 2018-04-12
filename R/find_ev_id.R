#' Find evolution ID
#'
#' @param name_val
#'
#' @return
#' @export
#'
#' @examples

find_ev_id <- function(name_val){
  for(i in c(1:10200)){
    url <- paste("http://pokeapi.co/api/v2/evolution-chain/", i, sep="")
    fei <- httr::GET(url)
    fei2 <- httr::content(fei)
    if(fei2$chain$species$name == name_val){
      return(i)
    }
  }
}

