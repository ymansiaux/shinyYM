#' Cree un bouton browser si on est en mode dev sur golem
#'
#' @param inputId inputId a utiliser
#' @param ... parametres supplementaires pour l'actionButton
#' @importFrom golem app_dev
#' @importFrom shiny actionButton
#' @return un bouton Pause
#' @export
#'
#' @examples \dontrun{
#' browserui("toto")
#' }
browserui <- function(inputId = NULL, ...) {
  if (app_dev()) {
    return(actionButton(inputId = inputId, "Pause"))
  }
}
