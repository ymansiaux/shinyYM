#' notie dependencies utils
#'
#' @description This function attaches notie. dependencies to the given tag
#'
#' @importFrom htmltools tagList htmlDependency
#' @export
add_notie_deps <- function() {
  notie_deps <-
    htmlDependency(
      name = "notie",
      version = "4.3.1",
      src = c(file = "notie-4.3.1"),
      script = c("js/notie.min.js"),
      stylesheet = "css/notie.min.css",
      package = "shinyYM",
    )

  notie_shiny_deps <-
    htmlDependency(
      name = "notie_shiny",
      version = "1.0.0",
      src = c(file = "notie-4.3.1"),
      script = "js/notie_shiny.js",
      package = "shinyYM",
    )

  tagList(notie_deps, notie_shiny_deps)
}
