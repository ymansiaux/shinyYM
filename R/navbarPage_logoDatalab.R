#' Créer une navbarPage shiny avec le logo du datalab inséré
#'
#' @param title titre accole au logo
#' @param style css
#' @param ... parametre supp
#'
#' @return un taglist
#' @export
#' @importFrom shiny tagList navbarPage img div tags
#' @importFrom golem use_internal_file
#'
#' @examples \dontrun{
#' # NE PAS UTILISER : pb avec les onglets obtenus
#' navbarPage_logoDatalab(title = "coucou")
#' }
navbarPage_logoDatalab <- function(title, style = "position:absolute;left:0%; top:20%;", ...) {
  use_internal_file(path = normalizePath(paste0(system.file("extdata", package = "shinybm"), "/LogoDataLab.png")), name = "LogoDataLab.png")

  tagList(navbarPage(title = tags$div(img(src = "www/LogoDataLab.png", height = "35px", width = "35px"), title,
    style = style, ...
  )))
}
