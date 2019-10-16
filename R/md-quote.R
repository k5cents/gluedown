#' @title Markdown Block Quotes
#' @description Form block quotes from a vector of character strings.
#' @details From the [GFM spec](https://github.github.com/gfm/#block-quote-marker):
#'   A block quote marker consists of 0-3 spaces of initial indent, plus (a) the
#'   character `>` together with a following space, or (b) a single character
#'   `>` not followed by a space.
#' @param x The character vector of quotes.
#' @param cat logical; Should the list be concatenated and printed, with each
#'   bullet element separated by a new line? Defaults to `TRUE`.
#' @return A character vector with a greater-than symbol (`>`) prepended to each
#'   element.
#' @examples
#' md_quote("Ask not what your country can do for you, but what you can do for your country.")
#' @export
md_quote <- function(x, cat = TRUE) {
  # todo: str_wrap?
  quote <- paste(">", x)
  if (cat) {
    cat(quote, sep = "\n")
  } else {
    return(quote)
  }
}
