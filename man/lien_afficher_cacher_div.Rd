% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lien_afficher_cacher_div.R
\name{lien_afficher_cacher_div}
\alias{lien_afficher_cacher_div}
\title{Permet de créer un lien sur lequel on clique pour afficher ou masquer un div}
\usage{
lien_afficher_cacher_div(id_lien, label_lien, id_div, contenu_div, ...)
}
\arguments{
\item{id_lien}{id pour le lien}

\item{label_lien}{label du lien}

\item{id_div}{id du div a afficher ou masquer}

\item{contenu_div}{contenu du div a afficher ou masquer}

\item{...}{parametres supplementaires du div}
}
\value{
un tagList
}
\description{
Permet de créer un lien sur lequel on clique pour afficher ou masquer un div
}
\examples{
\dontrun{
lien_afficher_cacher_div("toto", "toto", "toto", "toto")
}
}
