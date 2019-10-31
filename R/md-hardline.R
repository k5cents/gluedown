#' Markdown hard line breaks
#'
#' Take a character vector and return a collapsed glue vector with each original
#' element separated by two spaces and a newline. This inline is rendered as a
#' `<br />` HTML tag.
#'
#' @details
#' A line break (not in a code span or HTML tag) that is preceded by two or more
#' spaces and does not occur at the end of a block is parsed as a hard line
#' break (rendered in HTML as a `<br />` tag)
#' @param x A character vector of bullet point list items.
#' @return A `glue` vector of length 1 with elements of `x` separated by two
#'   spaces and a newline.
#' @family inline functions
#' @examples
#' # compare the following
#' md_bold(c("One", "Two"))
#'
#' md_hardline(md_bold(c("One", "Two")))
#' @importFrom glue glue_collapse
#' @export
md_hardline <- function(x) {
  glue::glue_collapse(x, sep = "  \n")
}

#' Markdown soft line breaks
#'
#' Take a character vector and return a collapsed glue vector with each original
#' element separated a single newline.
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
  glue::glue_collapse(x, sep = "\n")
}
