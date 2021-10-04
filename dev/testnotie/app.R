library(shiny)
library(shinyYM)

ui <- fluidPage(
    add_notie_deps(),
    actionButton(inputId = "b1", "input"),
    verbatimTextOutput("input")
)

server <- function(input, output, session) {

    observeEvent(input$b1, {

        add_notie_input(inputId = "input",
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
                        session)

    })

    output$input <- renderPrint(input$input)
}

# Run the application
shinyApp(ui = ui, server = server)
