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
#' @param text A character vector of text with another vector of URLs passed to
#'   the `url` argument.
#' @param url A character vector of URLs.
#' @param title The optional title of the link.
#' @param ... A sequence of `text = "/url"` named vector pairs. If any such
#'   pairs are provided, `.name` will be considered `TRUE`.
#' @param .name logical; if `TRUE`, the pairs in `...` will be used instead of
#'   any values supplied to `x` and `url`.
#' @return A `glue` vector of collapsed display text and associated URLs.
#' @family inline functions
#' @examples
#' md_link(1:5, glue::glue("https://{state.abb[1:5]}.gov"), state.name[1:5])
#' md_link(CRAN = "https://cran.r-project.org/")
#' @importFrom glue glue
#' @export
md_link <- function(text, url, title = NULL, ..., .name = FALSE) {
  x <- unlist(list(...))
  if (!is.null(x) | .name) {
    glue::glue("[{names(x)}]({unlist(x)})")
  } else if (!is.null(title)) {
    glue::glue("[{text}]({url} \"{title}\")")
  } else {
    glue::glue("[{text}]({url})")
  }
}


#' Markdown image links
#'
#' Take character vectors of alternative text, image link destinations, and
#' optional titles and return single glue vector of valid markdown inline image
#' links. This inline is rendered as the `<img>` HTML tag. Note that the
#' expected arguments of `md_image()` are reversed from `md_link()`
#'
#' @details
#' Syntax for images is like the syntax for links, with one difference. Instead
#' of link text, we have an image description. The rules for this are the same
#' as for link text, except that (a) an image description starts with `![`
#' rather than `[`, and (b) an image description may contain links. An image
#' description has inline elements as its contents. When an image is rendered to
#' HTML, this is standardly used as the image’s `alt` attribute.
#' @param url A character vector of link destination (URL) strings.
#' @param alt A character vector of alternative text that can be used to refer
#'   to an image.
#' @param title The optional title of the link.
#' @param ... A sequence of `alt = "/url"` named vector pairs. If any such
#'   pairs are provided, `.name` will be considered `TRUE`.
#' @param .name logical; if `TRUE`, the pairs in `...` will be used instead of
#'   any values supplied to `x` and `url`.
#' @return A `glue` vector of collapsed display text and associated URLs.
#' @return A `glue` vector of collapsed alternative text and associated URLs.
#' @family inline functions
#' @examples
#' if (file.exists("man/figures/logo.png")) md_image("man/figures/logo.png")
#' md_image("http://hexb.in/hexagons/eff.png")
#' md_image(EFF = "http://hexb.in/hexagons/eff.png")
#' md_image("http://hexb.in/hexagons/eff.png", "EFF Hex Sticker", "Logo")
#' @importFrom glue glue
#' @export
md_image <- function(url, alt = "", title = NULL, ..., .name = FALSE) {
  x <- unlist(list(...))
  if (!is.null(x) | .name) {
    if (is.null(names(x))) {
      glue::glue("![]({unlist(x)})")
    } else {
      glue::glue("![{names(x)}]({unlist(x)})")
    }
  } else if (!is.null(title)) {
    glue::glue("![{alt}]({url} \"{title}\")")
  } else {
    glue::glue("![{alt}]({url})")
  }
}

#' Markdown link label
#'
#' Create the link labels that can latter be referred to with a link reference
#' from [md_reference()].
#'
#' @details
#' A link label begins with a left bracket and ends with the first right bracket
#' that is not backslash-escaped. Between these brackets there must be at least
#' one non-whitespace character.
#' @param text The text in the document to be hyperlinked.
#' @param label A link label that is referenced elsewhere in the document.
#' @param ... A sequence of `label = "text"` named vector pairs. If any such
#'   pairs are provided, `.name` will be considered `TRUE`.
#' @param .name logical; if `TRUE`, the pairs in `...` will be used instead of
#'   any values supplied to `x` and `url`.
#' @return A single `glue` vector of length equal to that of `label` and `url`,
#'   with elements the concatenated arguments.
#' @family leaf block functions
#' @examples
#' md_label(CRAN = "The CRAN website")
#' md_label(text = c("one", "two"), label = 1:2)
#' @export
md_label <- function(text, label, ..., .name = FALSE) {
  x <- unlist(list(...))
  if (!is.null(x) | .name) {
    glue::glue("[{unlist(x)}][{names(x)}]")
  } else {
    glue::glue("[{text}][{label}]")
  }
}

#' Markdown link reference
#'
#' Take character vectors of link texts, link destinations, and optional titles
#' and return single glue vector of valid markdown link references. This
#' markdown leaf block then uses the `label` placed _elsewhere_ in a markdown
#' document to render `<href>` HTML tags.
#'
#' @details
#' A full reference link (6.6) consists of a link text immediately followed by a
#' link label that matches a link reference definition elsewhere in the
#' document...
#'
#' A link reference definition consists of a link label, indented up to three
#' spaces, followed by a colon (`:`), optional whitespace (including up to one
#' line ending), a link destination, optional whitespace (including up to one
#' line ending), and an optional link title, which if it is present must be
#' separated from the link destination by whitespace. No further non-whitespace
#' characters may occur on the line.
#'
#' A link reference definition does not correspond to a structural element of a
#' document. Instead, it defines a label which can be used in reference links
#' and reference-style images elsewhere in the document. Link reference
#' definitions can come either before or after the links that use them.
#' @param label A link label that is referenced elsewhere in the document.
#' @param url The URL to hyperlink the referenced text with.
#' @param title An _optional_ link title; defaults to `NULL`.
#' @param ... A sequence of `label = "/url"` named vector pairs. If any such
#'   pairs are provided, `.name` will be considered `TRUE`.
#' @param .name logical; if `TRUE`, the pairs in `...` will be used instead of
#'   any values supplied to `x` and `url`.
#' @return A single `glue` vector of length equal to that of `label` and `url`,
#'   with elements the concatenated arguments.
#' @family leaf block functions
#' @examples
#' md_reference(CRAN = "https://cran.r-project.org/")
#' md_reference(label = 1:2, url = c("https://one.org", "https://two.com"))
#' md_reference("tv", "https://www.tidyverse.org/", title = "tidyverse")
#' @export
md_reference <- function(label, url, title = NULL, ..., .name = FALSE) {
  x <- unlist(list(...))
  if (!is.null(x) | .name) {
    glue::glue("[{names(x)}]: {unlist(x)}")
  } else if (!is.null(title)) {
    glue::glue("[{label}]: {url} \"{title}\"")
  } else {
    glue::glue("[{label}]: {url}")
  }
}
