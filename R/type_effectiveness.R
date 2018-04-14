#' Discover which types are effective against one another
#'
#' @param type -- type
#' @param strength -- strength
#' @param direction -- direction
#'
#' @return Printed statements
#'
#' @import httr
#' @export
#'
#' @examples type_effectiveness(type="fire", strength="strong", direction="against")

type_effectiveness <- function(type, strength="all", direction="all"){

  query <- "type/?limit=20"
  request = glue::glue("http://pokeapi.co/api/v2/{query}")
  r <- httr::GET(request)

  types <- c()

  for (i in c(1:20)) {
    types <- c(types, httr::content(r,"parsed")$results[[i]]$name)
  }

  strengths <- c("strong", "weak", "all")
  directions <- c("to", "against", "all")

  if (type %in% types){
    if (strength %in% strengths){
      if (direction %in% directions){

        type_id = match(type, types)
        query <- paste("type/", type_id, "/", sep="")
        request = glue::glue("http://pokeapi.co/api/v2/{query}")
        r <- httr::GET(request)

        if (direction == "to"){
          if (strength == "strong"){
            print("Strong to:")
            for (j in c(1:20)){
              tryCatch(print(httr::content(r,"parsed")$damage_relations$half_damage_from[[j]]$name), error=function(e) NA)
            }
            cat("\n")

          }
          if (strength == "weak"){
            print("Weak to:")
            for (j in c(1:20)){
              tryCatch(print(httr::content(r,"parsed")$damage_relations$double_damage_from[[j]]$name), error=function(e) NA)
            }
            cat("\n")

          }
          if (strength == "all"){
            print("Strong to:")
            for (j in c(1:20)){
              tryCatch(print(httr::content(r,"parsed")$damage_relations$half_damage_from[[j]]$name), error=function(e) NA)
            }
            cat("\n")

            print("Weak to:")
            for (j in c(1:20)){
              tryCatch(print(httr::content(r,"parsed")$damage_relations$double_damage_from[[j]]$name), error=function(e) NA)
            }
            cat("\n")

          }
        }

        if (direction == "against"){
          if (strength == "strong"){
            print("Strong against:")
            for (j in c(1:20)){
              tryCatch(print(httr::content(r,"parsed")$damage_relations$double_damage_to[[j]]$name), error=function(e) NA)
            }
            cat("\n")

          }
          if (strength == "weak"){
            print("Weak against:")
            for (j in c(1:20)){
              tryCatch(print(httr::content(r,"parsed")$damage_relations$half_damage_to[[j]]$name), error=function(e) NA)
            }
            cat("\n")

          }
          if (strength == "all"){
            print("Strong against:")
            for (j in c(1:20)){
              tryCatch(print(httr::content(r,"parsed")$damage_relations$double_damage_to[[j]]$name), error=function(e) NA)
            }
            cat("\n")

            print("Weak against:")
            for (j in c(1:20)){
              tryCatch(print(httr::content(r,"parsed")$damage_relations$half_damage_to[[j]]$name), error=function(e) NA)
            }
            cat("\n")
          }
        }

        if (direction == "all"){
          if (strength == "strong"){
            print("Strong to:")
            for (j in c(1:20)){
              tryCatch(print(httr::content(r,"parsed")$damage_relations$half_damage_from[[j]]$name), error=function(e) NA)
            }
            cat("\n")

            print("Strong against:")
            for (j in c(1:20)){
              tryCatch(print(httr::content(r,"parsed")$damage_relations$double_damage_to[[j]]$name), error=function(e) NA)
            }
            cat("\n")

          }
          if (strength == "weak"){
            print("Weak to:")
            for (j in c(1:20)){
              tryCatch(print(httr::content(r,"parsed")$damage_relations$double_damage_from[[j]]$name), error=function(e) NA)
            }
            cat("\n")

            print("Weak against:")
            for (j in c(1:20)){
              tryCatch(print(httr::content(r,"parsed")$damage_relations$half_damage_to[[j]]$name), error=function(e) NA)
            }
            cat("\n")

          }
          if (strength == "all"){

            print("Strong to:")
            for (j in c(1:20)){
              tryCatch(print(httr::content(r,"parsed")$damage_relations$half_damage_from[[j]]$name), error=function(e) NA)
            }
            cat("\n")

            print("Weak to:")
            for (j in c(1:20)){
              tryCatch(print(httr::content(r,"parsed")$damage_relations$double_damage_from[[j]]$name), error=function(e) NA)
            }
            cat("\n")

            print("Strong against:")
            for (j in c(1:20)){
              tryCatch(print(httr::content(r,"parsed")$damage_relations$double_damage_to[[j]]$name), error=function(e) NA)
            }
            cat("\n")

            print("Weak against:")
            for (j in c(1:20)){
              tryCatch(print(httr::content(r,"parsed")$damage_relations$half_damage_to[[j]]$name), error=function(e) NA)
            }
            cat("\n")
          }
        }
      }
    }
  }
}
