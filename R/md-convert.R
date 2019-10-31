#' Convert markdown to HTML
#'
#' Take a character vector of valid markdown text and pass it to
#' [markdown::markdownToHTML()] to create a glue vector of HTML fragments.
#' Primarily used to test that `md_*()` functions create vectors that meet the
#' GFM spec and can be rendered as HTML.
#'
#' @param x A character vector of _markdown_ text to be converted.
#' @param frag logical; Whether only a single HTML fragment should be returned.
#'   `TRUE` by default.
#' @return A `glue` vector of length 1 containing HTML tags.
#' @examples
#' md_convert(x = md_bold("test"))
#' @importFrom glue glue
#' @export
md_convert <- function(x, frag = TRUE) {
  glue::as_glue(markdown::markdownToHTML(text = x, fragment.only = frag))
}
