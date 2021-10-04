#' Permet de créer un lien sur lequel on clique pour afficher ou masquer un div
#'
#' @param id_lien id pour le lien
#' @param label_lien label du lien
#' @param id_div id du div a afficher ou masquer
#' @param contenu_div contenu du div a afficher ou masquer
#' @param ... parametres supplementaires du div
#'
#' @importFrom shiny tagList tags
#' @importFrom shinyjs hidden
#' @return un tagList
#' @export
#'
#' @examples \dontrun{
#' lien_afficher_cacher_div("toto", "toto", "toto", "toto")
#' }
lien_afficher_cacher_div <- function(id_lien, label_lien, id_div, contenu_div, ...) {
  tagList(
    tags$a(id = id_lien, label_lien),
    hidden(
      tags$div(
        id = id_div,
        contenu_div,
        ...
      )
    )
  )
}
