#' Ajoute un ecran d'accueil shiny avec le logo du Datalab (shiny : cote ui)
#'
#' @param isinProd boolean indique si l'appli est en prod ou non (TRUE requis)
#' @return rien
#' @export
#' @importFrom shiny tagList img
#' @importFrom waiter use_waiter waiter_show_on_load
#' @importFrom golem use_internal_file
#'
#' @examples \dontrun{
#' waiter_logoDatalab(isinProd = TRUE)
#' }
waiter_logoDatalab <- function(isinProd) {
  use_internal_file(path = normalizePath(paste0(system.file("extdata", package = "shinybm"), "/LogoDataLab.png")), name = "LogoDataLab.png")
  if (isinProd) {
    shiny::tagList(
      waiter::use_waiter(),
      waiter::waiter_show_on_load(html = img(src = "www/LogoDataLab.png"))
    )
  }
}
