#' @title Convert Markdown to HTML
#' @description Wraps around [markdown::markdownToHTML()] to convert markdown
#'   text into HTML _fragments_.
#' @param md The markdown text to be converted.
#' @param frag logical; Whether only a single HTML fragment should be returned.
#' @return The HTML fragment equivalent.
#' @examples
#' md_convert(md = md_bold("Test"))
#' @importFrom glue glue
#' @export
md_convert <- function(md, frag = TRUE) {
  html <- markdown::markdownToHTML(text = md, fragment.only = frag)
  return(html)
}
