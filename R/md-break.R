#' @title Markdown horizontal rule
#' @description Print the markdown characters used to represent a _thematic
#'   break_. This markdown leaf block can be rendered as the `<hr>` HTML tag.
#' @details From the [GFM spec](https://github.github.com/gfm/): A line
#'   consisting of 0-3 spaces of indentation, followed by a sequence of three or
#'   more matching `-`, `_`, or `*` characters, each followed optionally by any
#'   number of spaces or tabs, forms a thematic break.
#' @param char The character used. Either an asterisk, hyphen, or underscore.
#' @param n The number of times to repeat each character.
#' @return A repeated-character `glue` vector with length 1.
#' @family leaf block functions
#' @examples
#' md_rule()
#' md_rule("_")
#' md_rule(n = 10)
#' @importFrom glue glue_collapse
#' @importFrom stringr str_dup
#' @export
md_rule <- function(char = c("*", "-", "_"), n = 3) {
  if (n < 3)  {
    stop("At least 3 characters must be used")
  }
  if (n > 80) {
    stop("Refrain from using more than 80 characters")
  }
  char <- match.arg(char)
  glue::glue("\n{stringr::str_dup(char, n)}\n")
}

