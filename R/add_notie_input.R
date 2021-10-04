#' Implemente la fonction date de la librairie JS notie
#'
#' @param inputId id qui va contenir la reponse de l'appel à la notif (TRUE/FALSE)
#' @param submitText texte de la case de validation de la notif
#' @param cancelText texte de la case de refus de la notif
#' @param position position de la notif : string ('top', 'bottom')
#' @param text titre de l'input
#' @param autocapitalize boolean
#' @param autocomplete boolean
#' @param autocorrect boolean
#' @param autofocus boolean
#' @param inputmode char
#' @param max integer
#' @param maxlength integer
#' @param min integer
#' @param minlength integer
#' @param placeholder placeholder
#' @param value valeur par défaut
#' @param spellcheck boolean
#' @param step integer
#' @param type text
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
#'   actionButton(inputId = "b1", "input"),
#'   verbatimTextOutput("input")
#' )
#'
#' server <- function(input, output, session) {
#'
#'   observeEvent(input$b1, {
#'
#'     add_notie_input(inputId = "input",
#'                     text = "Input notie",
#'                     submitText = "Valider",
#'                     cancelText = "Annuler",
#'                     position = "top",
#'                     autocapitalize = "none",
#'                     autocomplete = "off",
#'                     autocorrect = "off",
#'                     autofocus = TRUE,
#'                     inputmode = "latin",
#'                     max = 10000,
#'                     maxlength = NULL,
#'                     min = NULL,
#'                     minlength = NULL,
#'                     placeholder = "Entrez un texte",
#'                     value = "",
#'                     spellcheck = FALSE,
#'                     step = NULL,
#'                     type = "text",
#'                     session)
#'
#'   })
#'
#'   output$input <- renderPrint(input$input)
#' }
#'
#' # Run the application
#' shinyApp(ui = ui, server = server)
#' }

add_notie_input <- function(inputId = "input",
                            text = "Input notie",
                            submitText = "Valider",
                            cancelText = "Annuler",
                            position = "top",
                            autocapitalize = "none",
                            autocomplete = "off",
                            autocorrect = "off",
                            autofocus = TRUE,
                            inputmode = "latin",
                            max = 10000,
                            maxlength = NULL,
                            min = NULL,
                            minlength = NULL,
                            placeholder = "Entrez un texte",
                            value = "",
                            spellcheck = FALSE,
                            step = NULL,
                            type = "text",
                            session) {

  assert_that(position %in% c("top", "bottom"))
  assert_that(autocapitalize %in% c("none", "words"))
  assert_that(autocomplete %in% c("on", "off"))
  assert_that(autocorrect %in% c("on", "off"))
  assert_that(is.logical(autofocus))
  assert_that(inputmode %in% c("latin", "verbatim"))
  assert_that(is.logical(spellcheck))
  assert_that(is.null(maxlength) | is.numeric(maxlength))
  assert_that(is.null(max) | is.numeric(max))
  assert_that(is.null(minlength) | is.numeric(minlength))
  assert_that(is.null(min) | is.numeric(min))
  assert_that(is.null(step) | is.numeric(step))



  session$sendCustomMessage(
    type = "inputNotie",
    message = list(inputId = "input",
                   notie_params = list(text = text,
                                       submitText = submitText,
                                       cancelText = cancelText,
                                       position = position,
                                       autocapitalize = autocapitalize,
                                       autocomplete = autocomplete,
                                       autocorrect = autocorrect,
                                       autofocus = autofocus,
                                       inputmode = inputmode,
                                       max = max,
                                       maxlength = maxlength,
                                       min = min,
                                       minlength = minlength,
                                       placeholder = placeholder,
                                       value = value,
                                       spellcheck = spellcheck,
                                       step = step,
                                       type = type)
    )
  )
}
