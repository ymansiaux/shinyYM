#' Cree un div cache par defaut
#'
#' @param id_div id du div a cacher
#' @param contenu_div contenu du div a afficher ou masquer
#'
#' @importFrom shiny tagList tags
#' @importFrom shinyjs hidden
#' @param ... parametres supplementaires du div
#' @return un taglist
#' @export
#'
#' @examples \dontrun{
#' hidden_div("toto", "toto")
#' }
hidden_div <- function(id_div, contenu_div, ...) {
  tagList(
    hidden(
      tags$div(
        id = id_div,
        contenu_div,
        ...
      )
    )
  )
}
