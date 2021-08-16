library(shiny)
library(shinyYM)

ui <- fluidPage(

    sidebarLayout(
        sidebarPanel(
            actionButton(inputId = "addone", "Ajouter 1 étoile"),
            actionButton(inputId = "substractone", "Retirer 1 étoile"),

            verbatimTextOutput("resultat1"),
            verbatimTextOutput("resultat2")

        ),

        mainPanel(
           raterInput("exemple1", label = "exemple1", initial_value = 1, step_size = .5, max_value = 10),
           raterInput("exemple2", label = "exemple2", initial_value = 4, step_size = 1, max_value = 8, style = "font-size: 35px; color : gold;")

        )
    )
)

server <- function(input, output, session) {

    output$resultat1 <- renderPrint(input$exemple1)
    output$resultat2 <- renderPrint(input$exemple2)

    observeEvent(input$addone, {
        updateRaterInput(inputId = "exemple1", value = pmin(10, input$exemple1 + 1), session = session)
        updateRaterInput(inputId = "exemple2", value = pmin(8, input$exemple2 + 1), session = session)
    })

    observeEvent(input$substractone, {
        updateRaterInput(inputId = "exemple1", value = pmax(0, input$exemple1 - 1), session = session)
        updateRaterInput(inputId = "exemple2", value = pmax(0, input$exemple2 - 1), session = session)
    })
}

shinyApp(ui = ui, server = server)
