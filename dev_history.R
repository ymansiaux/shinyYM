usethis::use_build_ignore("dev_history.R")
usethis::use_build_ignore("dev/")
usethis::use_package("assertthat")

devtools::check()
# library(charpente)
#
# create_dependency(name = "notie",
#                   tag = "4.3.1",
#                   options = charpente_options(local = TRUE))

 # create_dependency(name = "rater-jquery",
 #                   tag = "1.0.0",
 #                   options = charpente_options(local = TRUE))


# git remote set-url origin https://montoken@github.com/ymansiaux/shinyYM
