#' Permet de créer un titre avec le logo du datalab acolle (par ex dans un navbarpage)
#'
#' @param main_title title colle au logo
#' @param style css eventuel
#'
#' @return un div
#' @export
#' @importFrom shiny tagList navbarPage img div tags
#' @importFrom golem use_internal_file
#'
#' @examples \dontrun{title_with_logoDatalab(main_title = "coucou")}
title_with_logoDatalab <- function(main_title, style = "margin-top:-10%;") {
  golem::use_internal_file(path = normalizePath(paste0(system.file("extdata", package = "shinybm"), "/LogoDataLab.png")), name = "LogoDataLab.png")
  return(tags$div(img(src = "www/LogoDataLab.png", height = "35px", width = "35px", style = style), main_title))
}
