#' Markdown horizontal rule (4.1)
#'
#' Create a glue vector of characters used to represent a _thematic break_. This
#' markdown leaf block is rendered as the `<hr>` HTML tag.
#'
#' @details
#' A line consisting of 0-3 spaces of indentation, followed by a sequence of
#' three or more matching `-`, `_`, or `*` characters, each followed optionally
#' by any number of spaces or tabs, forms a thematic break.
#' @param char The type of rule; either: `-`, `_`, or `*`. Defaults to `*`.
#' @param n The width of the rule; an integer indicating number of times to
#'   repeat each character. Defaults to the minimum of 3.
#' @param space logical or numeric; How many spaces to place between each
#'   `char`. Defaults to `FALSE`, which places 0 spaces.
#' @return A repeated-character `glue` vector with length 1.
#' @family leaf block functions
#' @examples
#' md_rule()
#' md_rule("_")
#' md_rule(n = 10)
#' md_rule(space = TRUE)
#' @importFrom glue glue_collapse
#' @export
md_rule <- function(char = c("*", "-", "_"), n = 3, space = FALSE) {
  if (n < 3)  {
    stop("At least 3 characters must be used")
  }
  char <- match.arg(char)
  spaces <- glue::glue_collapse(rep(" ", as.numeric(space)))
  if (length(spaces) == 0) {
    sep <- ""
  } else {
    sep <- spaces
  }
  glue::glue_collapse(rep(char, n), sep = sep)
}

