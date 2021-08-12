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

# Define UI for application that draws a histogram
ui <- fluidPage(
    add_notie_deps(),

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot"),
           actionButton(inputId = "b1", "b1"),
           actionButton("b2", "b2")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {

    observeEvent(input$b1,
                 shinyYM:::call_notie_alert(session = session))

    observeEvent(input$b2,
                 shinyYM:::call_notie_confirm(session = session))


    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application
shinyApp(ui = ui, server = server)
