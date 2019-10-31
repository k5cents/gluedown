#' Markdown soft line breaks
#'
#' Take a character vector and return a glue vector of separated by a single
#' newline. This inline is rendered as single `<p>` HTML tags.
#'
#' @details
#' A regular line break (not in a code span or HTML tag) that is not preceded by
#' two or more spaces or a backslash is parsed as a softbreak. (A softbreak may
#' be rendered in HTML either as a line ending or as a space. The result will be
#' the same in browsers. In the examples here, a line ending will be used.)
#' @param x A character vector of bullet point list items.
#' @return A `glue` vector of length 1 with elements of `x` separated by two
#'   spaces and a newline.
#' @family inline functions
#' @examples
#' # compare the following
#' md_bold(c("One", "Two"))
#'
#' md_softline(md_bold(c("One", "Two")))
#' @importFrom glue glue_collapse
#' @export
md_softline <- function(x) {
  glue::glue("{x}\n")
}
