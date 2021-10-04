#' Permet d'afficher une liste de div à partir de leurs ids
#'
#' @param ids une liste ou un vecteur
#'
#' @return rien
#' @export
#' @importFrom purrr walk
#' @importFrom shinyjs show
#'
#' @examples \dontrun{show_some_ids("coucou")}
show_some_ids <- function(ids) {

  if(!is.list(ids)) ids <- as.list(ids)

  walk(ids, .f = ~show(.))

}

