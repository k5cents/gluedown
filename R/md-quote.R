#' @title Markdown Block Quotes
#' @description Form block quotes from a vector of character strings.
#' @details From the [GFM spec](https://github.github.com/gfm/#block-quote-marker):
#'   A block quote marker consists of 0-3 spaces of initial indent, plus (a) the
#'   character `>` together with a following space, or (b) a single character
#'   `>` not followed by a space.
#' @param x The character vector of quotes.
#' @return A character vector with a greater-than symbol (`>`) prepended to each
#'   element.
#' @family container block functions
#' @examples
#' md_quote("Ask not what your country can do for you, but what you can do for your country.")
#' @export
md_quote <- function(x) {
  glue::glue("> {x}")
}
