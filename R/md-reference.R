#' @title Markdown link reference (4.7)
#' @description Combine elements of 2 or 3 character vetors into valid markdown
#'   link references. These markdown leaf blocks then use `label` placed
#'   _elsewhere_ in a markdown document to render as `<href>` HTML tags.
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
#'   may occur on the line...
#'
#'   A link reference definition does not correspond to a structural element of
#'   a document. Instead, it defines a label which can be used in
#'   [reference links](https://github.github.com/gfm/#reference-link) and
#'   reference-style [images](https://github.github.com/gfm/#images) elsewhere
#'   in the document. Link reference definitions can come either before or after
#'   the links that use them.
#' @param label A reference.
#' @param url The URL to lead to.
#' @param title The title of the link.
#' @return A single `glue` vector of length equal to that of `label` and `url`,
#'   with elements the concatenated arguments.
#' @family leaf block functions
#' @examples
#' md_reference("tv", "https://www.tidyverse.org/")
#' md_reference("tv", "https://www.tidyverse.org/", "tidyverse")
#' md_reference(label = c("one", "two"), url = c("https://one.org", "https://two.com"))
#' @export
md_reference <- function(label, url, title = NULL) {
  if (is.null(title)) {
    glue::glue("[{label}]: {url}")
  } else {
    glue::glue("[{label}]: {url} \"{title}\"")
  }
}
