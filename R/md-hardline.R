#' @title Markdown Hard Line Breaks
#' @description Separate strings with a hard line (non-paragraph) break.
#' @details From the [GFM spec](https://github.github.com/gfm/#hard-line-breaks):
#'   A line break (not in a code span or HTML tag) that is preceded by two or
#'   more spaces and does not occur at the end of a block is parsed as a hard
#'   line break (rendered in HTML as a `<br />` tag):
#' @param x The vector of bullet point list items.
#' @return A single string with elements of `x` separated with a hard line break.
#' @family inline functions
#' @examples
#' md_hardline(c("One", "Two"))
#' @export
md_hardline <- function(x) {
  glue::glue_collapse(x, sep = "  \n")
}
