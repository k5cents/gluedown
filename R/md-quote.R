#' Markdown block quotes
#'
#' Take a character vector and prepend each element in a greater-than symbol to
#' create a glue vector of block quote markdown text. This inline is rendered as
#' a `<blockquote>` HTML tag.
#'
#' @details
#' A block quote marker consists of 0-3 spaces of initial indent, plus (a) the
#' character `>` together with a following space, or (b) a single character `>`
#' not followed by a space.
#'
#' The following rules define block quotes:
#' 1. **Basic case.** If a string of lines _Ls_ constitute a sequence of blocks
#' _Bs_, then the result of prepending a block quote marker to the beginning of
#' each line in _Ls_ is a block quote containing _Bs_.
#' 2. **Laziness.** If a string of lines _Ls_ constitute a block quote with
#' contents _Bs_, then the result of deleting the initial block quote marker
#' from one or more lines in which the next non-whitespace character after the
#' block quote marker is paragraph continuation text is a block quote with _Bs_
#' as its content. Paragraph continuation text is text that will be parsed as
#' part of the content of a paragraph, but does not occur at the beginning of
#' the paragraph.
#' 3. **Consecutiveness.** A document cannot contain two block quotes in a row
#' unless there is a blank line between them.
#'
#' Nothing else counts as a block quote.
#' @param x The character vector of quotes.
#' @return A character vector with a greater-than symbol (`>`) prepended to each
#'   element.
#' @family container block functions
#' @examples
#' md_quote("Give me liberty, or give me death!")
#' md_quote(stringr::sentences[1:3])
#' @export
md_quote <- function(x) {
  glue::glue("> {x}")
}
