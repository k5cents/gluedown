#' @title Markdown Link Reference
#' @description Form the definition needed to reference a link destination
#'   elsewhere in a body of text.
#' @details From the [GFM spec](https://github.github.com/gfm/#link-reference-definition):
#'   A link reference definition consists of a
#'   [link label](https://github.github.com/gfm/#link-label), indented up to
#'   three spaces, followed by a colon (`:`), optional
#'   [whitespace](https://github.github.com/gfm/#whitespace) (including up to
#'   one [line ending](https://github.github.com/gfm/#line-ending)), a
#'   [link destination](https://github.github.com/gfm/#link-destination),
#'   optional whitespace (including up to one line ending), and an optional
#'   [link title](https://github.github.com/gfm/#link-title), which if it is
#'   present must be separated from the link destination by whitespace. No
#'   further
#'   [non-whitespace characters](https://github.github.com/gfm/#non-whitespace-character)
#'   may occur on the line.
#' @param label The character vector to be displayed as hyperlinked text.
#' @param url The URL to lead to.
#' @param title The title of the link.
#' @return A character vector of collapsed display text and associated URLs.
#' @family leaf block functions
#' @examples
#' md_reference("tv", "https://www.tidyverse.org/")
#' md_reference("tv", "https://www.tidyverse.org/", "tidyverse")
#' @export
md_reference <- function(label, url, title = NULL) {
  if (!is.null(title)) {
    glue::glue("[{label}]: {url} \"{title}\"")
  } else {
    glue::glue("[{label}]: {url}")
  }
}
