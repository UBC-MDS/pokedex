#' Return a data frame containing information about the specified berry.
#'
#' @param s A string specifying the berry name.
#'
#' @return A dataframe containing information about the specified berry.
#'
#' @import httr
#' @import tibble
#'
#'
#' @examples
#' data(berry_lookup)
#' get_berry("cheri")
#'
#' @export
get_berry <- function(s) {

  data(berry_lookup)
  if (!(s %in% berry_lookup$name)) stop("That berry is not in the PokeAPI database.")

  i <- berry_lookup$id[which(berry_lookup$name==s)]
  url <- paste(c("http://pokeapi.co/api/v2/berry/", i), collapse='')
  r <- httr::GET(url=url)
  x <- httr::content(r, 'parsed')

  b_name <- x$name
  b_growth_time <- x$growth_time
  b_size <- x$size
  b_firmness <- x$firmness$name

  df <- tibble::tibble(
    Name = b_name,
    `Growth Time` = b_growth_time,
    Size = b_size,
    Firmness = b_firmness
  )

  return(df)
}
