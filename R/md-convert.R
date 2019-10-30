#' @title Convert Markdown to HTML
#' @description Wraps around [markdown::markdownToHTML()] to convert markdown
#'   text into HTML _fragments_. Primarily used to test that `md_*()` functions
#'   create vectors that can be properly rendered as HTML.
#' @param x The _markdown_ text (from `md_*()`) to be converted.
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
