#' @title Markdown Thematic Break
#' @details From the [GFM spec](https://github.github.com/gfm/): A line
#'   consisting of 0-3 spaces of indentation, followed by a sequence of three or
#'   more matching `-`, `_`, or `*` characters, each followed optionally by any
#'   number of spaces or tabs, forms a thematic break.
#' @param char The character used. Either an asterisk, hyphen, or underscore.
#' @param n The number of times to repeat each character.
#' @return A character vector of a repeated horizontal rule character.
#' @family leaf block functions
#' @examples
#' md_break("_")
#' md_break(n = 10)
#' @importFrom glue glue_collapse
#' @export
md_break <- function(char = c("*", "-", "_"), n = 3) {
  if (n < 3)  { stop("At least 3 characters must be used") }
  if (n > 80) { stop("Refrain from using more than 80 characters") }
  char <- match.arg(char)
  rule <- glue::glue_collapse(rep(char, n))
  glue::glue("\n{rule}\n")
}
