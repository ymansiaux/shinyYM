#' Implemente la fonction alert de la librairie JS notie
#'
#' @param type type d'alerte : string ('success', 'warning', 'error', 'info', 'neutral')
#' @param text texte affiche dans l'alerte
#' @param stay la notif reste elle affichee sur l'ecran (boolean)
#' @param time duree d'affichage de la notif
#' @param position position de la notif : string ('top', 'bottom')
#' @param session argument session shiny
#'
#' @return une alerte notie
#' @export
#'
#' @importFrom assertthat assert_that
#'
#' @examples \dontrun{library(shiny)
#'library(shinyYM)
#'
#'ui <- fluidPage(
#'  add_notie_deps(),
#'  actionButton(inputId = "b1", "alert success"),
#'  actionButton(inputId = "b2", "alert warning"),
#'  actionButton(inputId = "b3", "alert error"),
#'  actionButton(inputId = "b4", "alert info"),
#'  actionButton(inputId = "b5", "alert neutral")
#')
#'
#'server <- function(input, output, session) {
#'
#'  observeEvent(input$b1,
#'                add_notie_alert(type = "success", text = "success",
#'                 stay = FALSE, time = 3, position = "top", session)
#'   )
#'
#'   observeEvent(input$b2,
#'                add_notie_alert(type = "warning", text = "warning",
#'                 stay = TRUE, time = 3, position = "bottom", session)
#'   )
#'
#'   observeEvent(input$b3,
#'                add_notie_alert(type = "error", text = "error",
#'                 stay = TRUE, time = 1, position = "bottom", session)
#'   )
#'
#'   observeEvent(input$b4,
#'                add_notie_alert(type = "info", text = "info",
#'                 stay = FALSE, time = 5, position = "top", session)
#'   )
#'
#'   observeEvent(input$b5,
#'                add_notie_alert(type = "neutral", text = "neutral",
#'                 stay = FALSE, time = 3, position = "bottom", session)
#'   )
#'
#' }
#'
#' # Run the application
#' shinyApp(ui = ui, server = server)
#' }

add_notie_alert <- function(type = "success", text = "", stay = FALSE,
                            time = 3, position = "top", session) {

  assert_that(type %in% c('success', 'warning', 'error', 'info', 'neutral'))
  assert_that(is.logical(stay))
  assert_that(time >= 1)
  assert_that(position %in% c("top", "bottom"))

  session$sendCustomMessage(
    type = "alertenotie",
    message = list(type = type, text = text, stay = stay,
                   time = time, position = position)
  )
}
