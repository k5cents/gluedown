#' @title Markdown Definition
#' @description Form a single-level unordered list from a vector.
#' @details Defintions are not supported in GFM, but _are_ supported by the
#'   [pandoc engine](https://pandoc.org/MANUAL.html#pandocs-markdown) used by R
#'   Markdown. Per that specification: Each term must fit on one line, which
#'   may optionally be followed by a blank line, and must be followed by one or
#'   more definitions. A definition begins with a colon or tilde, which may be
#'   indented one or two spaces.
#' @param term The chracter vector of terms to define.
#' @param def The character vector of definitions to be used for each term.
#' @param cat logical; Should the list be concatenated and printed, with each
#'   definition entry separated by a new line? Defaults to `TRUE`.
#' @return A character vector with elements preceded by an asterisk symbol.
#' @examples
#' md_define("Democracy", "Government by the people")
#' @export
md_define <- function(term, def, cat = TRUE) {
  entry <- paste(term, paste(":", def), sep = "\n")
  if (cat) {
    cat(entry, sep = "\n")
  } else {
    return(entry)
  }
}
