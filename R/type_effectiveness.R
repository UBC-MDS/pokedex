type_effectiveness <- function(type, strength="all", direction="all"){
  types <- pokedex:::lookup_type
  strengths <- c("strong", "weak", "all")
  directions <- c("to", "against", "all")
  
  if (type %in% types){
    if (strength %in% strengths){
      if (direction %in% directions){
        print("woo")
      }
    }
  }
}
