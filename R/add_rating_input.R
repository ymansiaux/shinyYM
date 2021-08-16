library(shiny)

raterInput <- function(inputId, label, initial_value, step_size, max_value, style = "") {
  tg <- tagList(
    tags$b(label),
   tags$div(id = inputId,
            class="rating",
            `data-initial-value` = initial_value,
            `data-max-value` = max_value,
            `data-step-size` = step_size,
            style = style
            )
  )


tagList(shinyYM:::add_rater_jquery_deps(tg))

}

updateRaterInput <- function(session, inputId, value) {
  session$sendInputMessage(inputId, list(value = value))
}
