#' Widget Rater pour Shiny
#'
#' @param inputId id de l'input
#' @param label label
#' @param initial_value valeur initiale
#' @param step_size pas entre 2 valeurs
#' @param max_value valeur maximale
#' @param width largeur du widget
#' @param style style css
#'
#' @importFrom shiny validateCssUnit tagList tags
#' @return un widget shiny
#' @export

#' @references https://github.com/auxiliary/rater/
#'
#' @examples \dontrun{
#' library(shiny)
#' library(shinyYM)
#'
#' ui <- fluidPage(
#'
#'   sidebarLayout(
#'     sidebarPanel(
#'       actionButton(inputId = "addone", "Ajouter 1 étoile"),
#'       actionButton(inputId = "substractone", "Retirer 1 étoile"),
#'
#'       verbatimTextOutput("resultat1"),
#'       verbatimTextOutput("resultat2")
#'
#'     ),
#'
#'     mainPanel(
#'       raterInput("exemple1", label = "exemple1", initial_value = 1,
#'       step_size = .5, max_value = 10),
#'       raterInput("exemple2", label = "exemple2", initial_value = 4,
#'       step_size = 1, max_value = 8, style = "font-size: 35px; color : gold;")
#'
#'     )
#'   )
#' )
#'
#' server <- function(input, output, session) {
#'
#'   output$resultat1 <- renderPrint(input$exemple1)
#'   output$resultat2 <- renderPrint(input$exemple2)
#'
#'   observeEvent(input$addone, {
#'     updateRaterInput(inputId = "exemple1",
#'     value = pmin(10, input$exemple1 + 1), session = session)
#'     updateRaterInput(inputId = "exemple2",
#'     value = pmin(8, input$exemple2 + 1), session = session)
#'   })
#'
#'   observeEvent(input$substractone, {
#'     updateRaterInput(inputId = "exemple1",
#'     value = pmax(0, input$exemple1 - 1), session = session)
#'     updateRaterInput(inputId = "exemple2",
#'     value = pmax(0, input$exemple2 - 1), session = session)
#'   })
#' }
#'
#' shinyApp(ui = ui, server = server)
#' }
raterInput <- function(inputId, label, initial_value, step_size, max_value, width = NULL, style = "") {
  tg <- tagList(
    tags$div(
      class = "form-group shiny-input-container",
      style = if (!is.null(width)) {
        paste0("width: ", validateCssUnit(width), ";")
      },
      # input label
      tags$b(label),

      tagList(
        tags$div(
          id = inputId,
          class = "rating",
          `data-initial-value` = initial_value,
          `data-max-value` = max_value,
          `data-step-size` = step_size,
          style = style
        )
      )
    )
  )

  tagList(add_rater_jquery_deps(tg))

}

#' Mise à jour de la valeur du widget Rater
#'
#' @param session objet shiny
#' @param inputId id de l'input
#' @param value valeur à définir
#'
#' @return un widget Rater
#' @export
#'
#' @examples \dontrun{
#' updateRaterInput(session, inputId = "rater", value = 12)
#' }
updateRaterInput <- function(session, inputId, value) {
  session$sendInputMessage(inputId, list(value = value))
}
