#' Markdown paragraphs
#'
#' Take a character vector and return a glue vector of paragraphs separated by
#' double newlines. This leaf block is rendered as distinct `<p>` HTML tags.
#'
#' @details
#' A sequence of non-blank lines that cannot be interpreted as other kinds of
#' blocks forms a paragraph. The contents of the paragraph are the result of
#' parsing the paragraph’s raw content as inlines. The paragraph’s raw content
#' is formed by concatenating the lines and removing initial and final
#' whitespace... Paragraphs can contain multiple lines, but no blank lines.
#' @param x A character vector of distinct paragraphs.
#' @family leaf block functions
#' @examples
#' md_paragraph(stringr::sentences[1:3])
#' @importFrom glue glue
#' @export
md_paragraph <- function(x) {
  glue::glue("{x}\n\n")
}
