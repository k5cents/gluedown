#' @title Markdown Escape Punctuation
#' @description When trying to format text containing markdown syntax
#'   characters, it's necessary to "escape" those characters so that they are
#'   ignored by formatting.
#' @details From the [GFM spec](https://github.github.com/gfm/#backslash-escapes):
#'  Any ASCII punctuation character may be backslash-escaped... Any ASCII
#'  punctuation character may be backslash-escaped... Escaped characters are
#'  treated as regular characters and do not have their usual Markdown meanings.
#' @param x The text with punctuation to escape.
#' @return A character string with all `[:punct:]` properly escaped with
#'   prepended backslashes.
#' @family inline functions
#' @examples
#' md_bold(md_escape("Use an * symbol in globs!"))
#' @importFrom stringr str_replace_all
#' @export
md_escape <- function(x) {
  stringr::str_replace_all(
    string = x,
    pattern = "([[:punct:]])",
    replacement = "\\\\\\1"
  )
}
