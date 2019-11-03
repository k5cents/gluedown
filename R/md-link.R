#' Markdown inline link (6.6)
#'
#' Take character vectors of link texts, link destinations, and optional titles
#' and return single glue vector of valid markdown inline links. This inline is
#' rendered as the `<href>` HTML tag.
#'
#' @details
#' A link contains link text (the visible text), a link destination (the URI
#' that is the link destination), and optionally a link title. There are two
#' basic kinds of links in Markdown. In inline links the destination and title
#' are given immediately after the link text.
#'
#' A link text consists of a sequence of zero or more inline elements enclosed
#' by square brackets (`[` and `]`)...
#'
#' An inline link consists of a link text followed immediately by a left
#' parenthesis `(`, optional whitespace, an optional link destination, an
#' optional link title separated from the link destination by whitespace,
#' optional whitespace, and a right parenthesis `)`. The link’s text consists of
#' the inlines contained in the link text (excluding the enclosing square
#' brackets). The link’s URI consists of the link destination, excluding
#' enclosing `<...>` if present, with backslash-escapes in effect as described
#' above. The link’s title consists of the link title, excluding its enclosing
#' delimiters, with backslash-escapes in effect as described above.
#' @param text The character vector to be displayed as hyperlinked text.
#' @param url The URL to lead to.
#' @param title The optional title of the link.
#' @return A `glue` vector of collapsed display text and associated URLs.
#' @family inline functions
#' @examples
#' md_link("tidyverse", "https://www.tidyverse.org/")
#' md_link(c("R Project", "CRAN"), c("https://www.r-project.org/", "https://cran.r-project.org/"))
#' @importFrom glue glue
#' @export
md_link <- function(text, url, title = NULL) {
  if (!is.null(title)) {
    glue::glue("[{text}]({url} \"{title}\")")
  } else {
    glue::glue("[{text}]({url})")
  }
}


#' Markdown image links
#'
#' Take character vectors of alternative text, image link destinations, and
#' optional titles and return single glue vector of valid markdown inline image
#' links. This inline is rendered as the `<img>` HTML tag.
#'
#' @details
#' Syntax for images is like the syntax for links, with one difference. Instead
#' of link text, we have an image description. The rules for this are the same
#' as for link text, except that (a) an image description starts with `![`
#' rather than `[`, and (b) an image description may contain links. An image
#' description has inline elements as its contents. When an image is rendered to
#' HTML, this is standardly used as the image’s `alt` attribute.
#' @param alt A character vector of
#'    [alternative text](https://en.wikipedia.org/wiki/Alt_attribute) that can
#'    be used to refer to an image.
#' @param url A character vector of link destination (URL) strings.
#' @param title The optional title of the link.
#' @return A `glue` vector of collapsed alternative text and associated URLs.
#' @family inline functions
#' @examples
#' if (file.exists("man/figures/logo.png")) md_image("man/figures/logo.png")
#' md_image("http://hexb.in/hexagons/eff.png")
#' md_image("http://hexb.in/hexagons/eff.png", "EFF Hex Sticker")
#' md_image("http://hexb.in/hexagons/eff.png", "EFF Hex Sticker", "Logo")
#' @importFrom glue glue
#' @export
md_image <- function(url, alt = "", title = NULL) {
  if (!is.null(title)) {
    glue::glue("![{alt}]({url} \"{title}\")")
  } else {
    glue::glue("![{alt}]({url})")
  }
}
