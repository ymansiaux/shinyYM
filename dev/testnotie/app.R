library(shiny)
library(shinyYM)

ui <- fluidPage(
    add_notie_deps(),
    actionButton(inputId = "b1", "alert success"),
    actionButton(inputId = "b2", "alert warning"),
    actionButton(inputId = "b3", "alert error"),
    actionButton(inputId = "b4", "alert info"),
    actionButton(inputId = "b5", "alert neutral")
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {

    observeEvent(input$b1,
                 add_notie_alert(type = "success", text = "success", stay = FALSE, time = 3, position = "top", session)
    )

    observeEvent(input$b2,
                 add_notie_alert(type = "warning", text = "warning", stay = TRUE, time = 3, position = "bottom", session)
    )

    observeEvent(input$b3,
                 add_notie_alert(type = "error", text = "error", stay = TRUE, time = 1, position = "bottom", session)
    )

    observeEvent(input$b4,
                 add_notie_alert(type = "info", text = "info", stay = FALSE, time = 5, position = "top", session)
    )

    observeEvent(input$b5,
                 add_notie_alert(type = "neutral", text = "neutral", stay = FALSE, time = 3, position = "bottom", session)
    )

}

# Run the application
shinyApp(ui = ui, server = server)
