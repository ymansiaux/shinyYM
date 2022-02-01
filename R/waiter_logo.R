#' Ajoute un ecran d'accueil shiny avec un logo
#'
#' @param isinProd boolean indique si l'appli est en prod ou non (TRUE requis)
#' @param img_path lien vers l'image à utiliser
#' @return rien
#' @export
#' @importFrom shiny tagList img
#' @importFrom waiter use_waiter waiter_show_on_load
#'
#' @examples \dontrun{
#' waiter_logoDatalab(isinProd = TRUE)
#' }
waiter_logo <- function(isinProd, img_path) {
  if (isinProd) {
    shiny::tagList(
      waiter::use_waiter(),
      waiter::waiter_show_on_load(html = img(src = img_path))
    )
  }
}
