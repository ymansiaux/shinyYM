#' Fermeture de l'ecran de chargement avec logo
#'
#' @param isinProd boolean indique si l'appli est en prod ou non (TRUE requis)
#' @param display_duration duree d'affichage de l'ecran de loading
#'
#' @return rien
#' @export
#' @importFrom waiter waiter_hide
#' @examples
closeWaiter <- function(isinProd, display_duration = 5) {
  if (isinProd) {
    Sys.sleep(display_duration)
    waiter::waiter_hide()
  }
}
