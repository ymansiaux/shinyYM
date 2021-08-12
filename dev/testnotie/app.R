library(shiny)
library(shinyYM)

ui <- fluidPage(
    add_notie_deps(),
    actionButton(inputId = "b1", "confirm"),
    verbatimTextOutput("date")
)

server <- function(input, output, session) {

    observeEvent(input$b1, {

        add_notie_date_dialog(inputId = "date",
                              submitText = "Valider",
                              cancelText = "Annuler",
                              position = "top",
                              session)
    })

    output$date <- renderPrint(input$date)

}

# Run the application
shinyApp(ui = ui, server = server)
