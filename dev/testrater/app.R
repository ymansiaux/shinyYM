#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyYM)
# devtools::load_all()
# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            actionButton(inputId = "addone", "Ajouter 1 étoile"),
            actionButton(inputId = "substractone", "Retirer 1 étoile"),

            verbatimTextOutput("resultat1"),
            verbatimTextOutput("resultat2")

        ),

        # Show a plot of the generated distribution
        mainPanel(
           shinyYM:::raterInput("exemple1", label = "exemple1", initial_value = 1, step_size = .5, max_value = 10),
           shinyYM:::raterInput("exemple2", label = "exemple2", initial_value = 1, step_size = .5, max_value = 10, style = "font-size: 35px; color : gold;")


        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {

    output$resultat1 <- renderPrint(input$exemple1)
    output$resultat2 <- renderPrint(input$exemple2)

    observeEvent(input$addone, {
        shinyYM:::updateRaterInput(inputId = "exemple1", value = pmin(10, input$exemple1 + 1), session = session)
        shinyYM:::updateRaterInput(inputId = "exemple2", value = pmin(10, input$exemple2 + 1), session = session)
    })

    observeEvent(input$substractone, {
        shinyYM:::updateRaterInput(inputId = "exemple1", value = pmax(0, input$exemple1 - 1), session = session)
        shinyYM:::updateRaterInput(inputId = "exemple2", value = pmax(0, input$exemple2 - 1), session = session)
    })


}

# Run the application
shinyApp(ui = ui, server = server)
