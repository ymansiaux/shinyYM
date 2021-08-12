call_notie_alert <- function(session) {

  shinyYM:::add_notie_deps()
  # shinyYM:::add_shiny_notie_deps()

  session$sendCustomMessage(
    type = "alertenotie",
    message = list(type = 3, text = "Echec de la connexion aux data", stay = FALSE, time = 5, position = "bottom")
  )
}


call_notie_confirm <- function(session) {

  shinyYM:::add_notie_deps()
  # shinyYM:::add_shiny_notie_deps()

  session$sendCustomMessage(
    type = "alertenotie",
    message = list(type = 1, text = "Echec de la connexion aux data", stay = FALSE, time = 5, position = "bottom")
  )
}
