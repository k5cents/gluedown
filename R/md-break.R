#' @title Markdown Thematic Break
#' @details From the [GFM spec](https://github.github.com/gfm/): A line
#'   consisting of 0-3 spaces of indentation, followed by a sequence of three or
#'   more matching `-`, `_`, or `*` characters, each followed optionally by any
#'   number of spaces or tabs, forms a thematic break.
#' @param char The character used. Either an asterisk, hyphen, or underscore.
#' @param n The number of times to repeat each character.
#' @param cat logical; Should the list be concatenated and printed, with each
#'   definition entry separated by a new line? Defaults to `TRUE`.
#' @return A character vector of a repeated horizontal rule character.
#' @examples
#' md_break()
#' md_break("_", n = 10)
#' @importFrom glue glue_collapse
#' @export
md_break <- function(char = c("*", "-", "_"), n = 3, cat = TRUE) {
  if (n < 3) {
    stop("At least 3 characters must be used")
  }
  if (n > 80) {
    stop("Refrain from using more than 80 characters")
  }
  char <- match.arg(char)
  rule <- glue::glue_collapse(rep(char, n))
  if (cat) {
    cat("\n", rule, sep = "\n")
  } else {
    return(rule)
  }
}
