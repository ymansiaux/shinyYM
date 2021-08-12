library(shiny)
library(shinyYM)

ui <- fluidPage(
    add_notie_deps(),
    actionButton(inputId = "b1", "confirm"),
    verbatimTextOutput("notie_confirm_answer")
)

server <- function(input, output, session) {

    observeEvent(input$b1, {
        add_notie_confirm(inputId = "notie_confirm_answer",
                          text = "Confirmation",
                          submitText = "Valider",
                          cancelText = "Annuler",
                          position = "top",
                          session)
    })

    output$notie_confirm_answer <- renderPrint(input$notie_confirm_answer)

}

# Run the application
shinyApp(ui = ui, server = server)
