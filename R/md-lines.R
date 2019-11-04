#' Markdown soft line breaks
#'
#' Take a character vector and return a glue vector of separated by a single
#' newline. This inline is rendered as single `<p>` HTML tags.
#'
#' @details
#' A regular line break (not in a code span or HTML tag) that is not preceded by
#' two or more spaces or a backslash is parsed as a softbreak. (A softbreak may
#' be rendered in HTML either as a line ending or as a space. The result will be
#' the same in browsers. In the examples here, a line ending will be used.)
#' @param ... Any number of character vectors.
#' @return A `glue` vector with elements of `...` separated by a single newline.
#' @family inline functions
#' @examples
#' # compare the following
#' md_bold(c("One", "Two"))
#'
#' md_softline(md_bold(c("One", "Two")))
#' @importFrom glue glue_collapse
#' @export
md_softline <- function(...) {
  dots <- unlist(list(...))
  glue::glue("{dots}\n")
}

#' Markdown hard line breaks
#'
#' Take a character vector and return a collapsed glue vector with each original
#' element separated by two spaces and a newline. This inline is rendered with a
#' `<br />` HTML tag.
#'
#' @details
#' A line break (not in a code span or HTML tag) that is preceded by two or more
#' spaces and does not occur at the end of a block is parsed as a hard line
#' break (rendered in HTML as a `<br />` tag)
#' @param ... Any number of character vectors.
#' @return A `glue` vector with elements of `...` separated by two trailing
#'   spaces and a single newline.
#' @family inline functions
#' @examples
#' # compare the following
#' md_bold(c("One", "Two"))
#' md_hardline(md_bold(c("One", "Two")), md_italic("Three"))
#' @importFrom glue glue_collapse
#' @export
md_hardline <- function(...) {
  dots <- unlist(list(...))
  glue::glue("{dots}  \n")
}

#' Markdown paragraphs breaks
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
#' @param ... Any number of character vectors.
#' @return A `glue` vector with elements of `...` separated by two newlines.
#' @family leaf block functions
#' @examples
#' md_paragraph(stringr::sentences[1:3])
#' @importFrom glue glue
#' @export
md_paragraph <- function(...) {
  dots <- unlist(list(...))
  glue::glue("{dots}\n\n")
}

#' Markdown blank line
#'
#' Create a blank line between other markdown block-level elements.
#'
#' @details
#' Blank lines between block-level elements are ignored, except for the role
#' they play in determining whether a list is tight or loose.
#'
#' Blank lines at the beginning and end of the document are also ignored.
#' @return A `glue` vector of length one containing two newline characters.
#' @family leaf block functions
#' @examples
#' md_blank
#' @importFrom glue glue
#' @export
md_blank <- function() {
  glue::glue("\n")
}
