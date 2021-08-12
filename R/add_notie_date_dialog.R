#' Implemente la fonction date de la librairie JS notie
#'
#' @param inputId id qui va contenir la reponse de l'appel à la notif (TRUE/FALSE)
#' @param submitText texte de la case de validation de la notif
#' @param cancelText texte de la case de refus de la notif
#' @param position position de la notif : string ('top', 'bottom')
#' @param session argument session shiny
#'
#' @return une alerte notie
#' @details https://github.com/jaredreich/notie
#' @details https://codingshiksha.com/javascript/notie-js-javascript-alert-toast-notification-library-full-tutorial-with-examples/
#' @export
#'
#' @importFrom assertthat assert_that
#'
#' @examples \dontrun{library(shiny)
#' library(shinyYM)
#'
#' ui <- fluidPage(
#'   add_notie_deps(),
#'   actionButton(inputId = "b1", "confirm"),
#'   verbatimTextOutput("date")
#' )
#'
#' server <- function(input, output, session) {
#'
#'   observeEvent(input$b1, {
#'
#'     add_notie_date_dialog(inputId = "date",
#'                           submitText = "Valider",
#'                           cancelText = "Annuler",
#'                           position = "top",
#'                           session)
#'   })
#'
#'   output$date <- renderPrint(input$date)
#'
#' }
#'
#' # Run the application
#' shinyApp(ui = ui, server = server)
#' }

add_notie_date_dialog <- function(inputId = "date",
                                  submitText = "Valider",
                                  cancelText = "Annuler",
                                  position = "top",
                                  session) {

  assert_that(position %in% c("top", "bottom"))

  session$sendCustomMessage(
    type = "dateNotie",
    message = list(inputId = inputId,
                   notie_params = list(submitText = submitText,
                                       cancelText = cancelText, position = position)
    )
  )
}
