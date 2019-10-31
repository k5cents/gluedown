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
#' @return A single `glue` vector of length equal to that of `label` and `url`,
#'   with elements the concatenated arguments.
#' @family leaf block functions
#' @examples
#' md_reference("tv", "https://www.tidyverse.org/", "tidyverse")
#' md_reference(label = 1:2, url = c("https://one.org", "https://two.com"))
#' @export
md_reference <- function(label, url, title = NULL) {
  if (is.null(title)) {
    glue::glue("[{label}]: {url}")
  } else {
    glue::glue("[{label}]: {url} \"{title}\"")
  }
}
