#' Discover which types are effective against one another
#'
#' @param type -- type
#' @param strength -- strength
#' @param direction -- direction
#'
#' @return Data frames containing the correct type match-up information, Boolean FALSE if the arguments are wrong
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

        st <- c()
        wt <-  c()
        sa <- c()
        wa <- c()

        for (j in c(1:20)){

          tryCatch({
            st <- c(st, httr::content(r,"parsed")$damage_relations$half_damage_from[[j]]$name)
          }, error=function(e) NA)

          tryCatch({
            wt <- c(wt, httr::content(r,"parsed")$damage_relations$double_damage_from[[j]]$name)
          }, error=function(e) NA)

          tryCatch({
            sa <- c(sa, httr::content(r,"parsed")$damage_relations$double_damage_to[[j]]$name)
          }, error=function(e) NA)

          tryCatch({
            wa <- c(wa, httr::content(r,"parsed")$damage_relations$half_damage_to[[j]]$name)
          }, error=function(e) NA)

        }

        df_st <- data.frame(st)
        df_wt <- data.frame(wt)
        df_sa <- data.frame(sa)
        df_wa <- data.frame(wa)

        names(df_st) <- c("Strong To")
        names(df_wt) <- c("Weak To")
        names(df_sa) <- c("Strong Against")
        names(df_wa) <- c("Weak Against")

        if (direction == "to"){
          if (strength == "strong"){
            return(df_st)
          }
          if (strength == "weak"){
            return(df_wt)
          }
          if (strength == "all"){
            return(list(df_st, df_wt))
          }
        }

        if (direction == "against"){
          if (strength == "strong"){
            return(df_sa)
          }
          if (strength == "weak"){
            return(df_wa)
          }
          if (strength == "all"){
            return(list(df_sa, df_wa))
          }
        }

        if (direction == "all"){
          if (strength == "strong"){
            return(list(df_st, df_sa))
          }
          if (strength == "weak"){
            return(list(df_wt, df_wa))
          }
          if (strength == "all"){
            return(list(df_st, df_wt, df_sa, df_wa))
          }
        }
      }
      else{
        return(FALSE)
      }
    }
    else{
      return(FALSE)
    }
  }
  else{
    return(FALSE)
  }
}
