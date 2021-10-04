#' Permet de masquer une liste de div à partir de leurs ids
#'
#' @param ids une liste ou un vecteur
#'
#' @return rien
#' @export
#' @importFrom purrr walk
#' @importFrom shinyjs hide
#'
#' @examples \dontrun{hide_some_ids("coucou")}
hide_some_ids <- function(ids) {

  if(!is.list(ids)) ids <- as.list(ids)

  walk(ids, .f = ~hide(.))

}
