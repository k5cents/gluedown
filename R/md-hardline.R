#' @title Markdown hard line breaks (6.12)
#' @description Separate strings with a hard line (non-paragraph) break. This
#' inline hard line break can be rendered as `<br />` HTML tags.
#' @details A line break (not in a code span or HTML tag) that is preceded by
#'   two or more spaces and does not occur at the end of a block is parsed as a
#'   hard line break (rendered in HTML as a `<br />` tag)
#' @param x A character vector of bullet point list items.
#' @return A `glue` vector of length 1 with elements of `x` separated by two
#'   spaces and a newline.
#' @family inline functions
#' @examples
#' md_hardline(md_bold(c("One", "Two")))
#' md_hardline(state.name[1:10])
#' @importFrom glue glue_collapse
#' @export
md_hardline <- function(x) {
  glue::glue_collapse(x, sep = "  \n")
}
