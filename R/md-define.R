#' Markdown definitions
#'
#' Take a character vector of terms and of corresponding definitions and return
#' a single glue vector of concatenated entries separated by two newlines. This
#' container is rendered as the `<dl>` HTML
#'
#' @details
#' Definitions are not supported in GFM, but _are_ supported by the
#' [pandoc engine](https://pandoc.org/MANUAL.html#pandocs-markdown) used by R
#' Markdown. Per that specification: Each term must fit on one line, which may
#' optionally be followed by a blank line, and must be followed by one or more
#' definitions. A definition begins with a colon or tilde, which may be indented
#' one or two spaces.
#' @param term A character vector of terms to define.
#' @param def A character vector of definitions to be used for each `term.`
#' @return A character vector with elements preceded by an asterisk symbol.
#' @family container block functions
#' @examples
#' md_define("Democracy", md_italic("Government by the people"))
#' md_define(state.abb[1:5], state.name[1:5])
#' @importFrom glue glue
#' @export
md_define <- function(term, def) {
  glue::glue("{term}\n:    {def}\n\n")
}


