#' rater-jquery dependencies utils
#'
#' @description This function attaches rater-jquery. dependencies to the given tag
#'
#' @param tag Element to attach the dependencies.
#'
#' @importFrom htmltools tagList htmlDependency
#' @export
add_rater_jquery_deps <- function(tag) {
  rater_jquery_deps <- htmlDependency(
    name = "rater-jquery",
    version = "1.0.0",
    src = c(file = "rater-jquery-1.0.0"),
    script = "js/rater.min.js",
    package = "shinyYM",
  )

  rater_shiny_deps <-
    htmlDependency(
      name = "rater_shiny",
      version = "1.0.0",
      src = c(file = "rater-jquery-1.0.0"),
      script = "js/rater_shiny.js",
      package = "shinyYM",
    )

  tagList(tag, rater_jquery_deps, rater_shiny_deps)
}
