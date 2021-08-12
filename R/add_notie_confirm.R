#' Implemente la fonction alert de la librairie JS notie
#'
#' @param inputId id qui va contenir la reponse de l'appel à la notif (TRUE/FALSE)
#' @param text texte affiche dans l'alerte
#' @param submitText texte de la case de validation de la notif
#' @param cancelText texte de la case de refus de la notif
#' @param position position de la notif : string ('top', 'bottom')
#' @param session argument session shiny
#'
#' @return une alerte notie
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
#'   verbatimTextOutput("notie_confirm_answer")
#' )
#'
#' server <- function(input, output, session) {
#'
#'   observeEvent(input$b1, {
#'     add_notie_confirm(inputId = "notie_confirm_answer",
#'                       text = "Confirmation",
#'                       submitText = "Valider",
#'                       cancelText = "Annuler",
#'                       position = "top",
#'                       session)
#'   })
#'
#'   output$notie_confirm_answer <- renderPrint(input$notie_confirm_answer)
#'
#' }
#'
#' # Run the application
#' shinyApp(ui = ui, server = server)
#'
#' }

add_notie_confirm <- function(inputId = "confirm",
                              text = "Confirmation",
                              submitText = "Valider",
                              cancelText = "Annuler",
                              position = "top",
                              session) {

  session$sendCustomMessage(
    type = "confirmNotie",
    message = list(inputId = inputId,
                   notie_params = list(text = text, submitText = submitText,
                                       cancelText = cancelText, position = position)
    )
  )
}
