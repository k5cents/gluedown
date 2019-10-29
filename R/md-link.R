#' @title Markdown Inline Like
#' @description Form an inline hyperlink to an another website.
#' @details From the [GFM spec](https://github.github.com/gfm/#inline-link):
#'   An inline link consists of a [link text](https://github.github.com/gfm/#link-text)
#'   followed immediately by a left parenthesis `(`... an optional link
#'   destination, an optional link title separated from the link destination by
#'   whitespace, optional whitespace, and a right parenthesis `)`.
#' @param text The character vector to be displayed as hyperlinked text.
#' @param url The URL to lead to.
#' @param title The title of the link.
#' @return A character vector of collapsed display text and associated URLs.
#' @family inline functions
#' @examples
#' md_link("tidyverse", "https://www.tidyverse.org/")
#' md_link(c("R Project", "CRAN"), c("https://www.r-project.org/", "https://cran.r-project.org/"))
#' @export
md_link <- function(text, url, title = NULL) {
  if (!is.null(title)) {
    glue::glue("[{text}]({url}) \"{title}\"")
  } else {
    glue::glue("[{text}]({url})")
  }
}

#' @title Markdown Image
#' @param alt The optional
#'    [alternative text](https://en.wikipedia.org/wiki/Alt_attribute) that can
#'    be used to refer to an image.
#' @param url The URL of an image to be displayed or referenced.
#' @return A character vector of collapsed alternative text and associated URLs.
#' @family inline functions
#' @examples
#' md_image("http://hexb.in/hexagons/eff.png")
#' md_image("http://hexb.in/hexagons/eff.png", "EFF Hex Sticker")
#' @export
md_image <- function(url, alt = "") {
  glue::glue("![{alt}]({url})")
}
