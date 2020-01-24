#' Markdown ATX headings
#'
#' Turn a character vector into a vector of valid markdown ATX headings. These
#' markdown leaf blocks can be rendered as the `<h1>` through `<h6>` HTML tags.
#' See [md_setext()] to create setext (underlined) headings.
#'
#' @details
#' An ATX heading consists of a string of characters, parsed as inline content,
#' between an opening sequence of 1–6 unescaped `#` characters and an optional
#' closing sequence of any number of unescaped `#` characters. The opening
#' sequence of `#` characters must be followed by a space or by the end of line.
#' The optional closing sequence of `#`s must be preceded by a space and may be
#' followed by spaces only. The opening # character may be indented 0-3 spaces.
#' The raw contents of the heading are stripped of leading and trailing spaces
#' before being parsed as inline content. The heading level is equal to the
#' number of `#` characters in the opening sequence.
#' @param x A character vector of heading text.
#' @param level A numeric vector of use to determine the number of heading hash
#'   characters to preceed each element of `x`. The heading level is equal to
#'   the number of `#` characters in the opening sequence.
#' @return A `glue` vector of headings with length equal to `x`.
#' @family leaf block functions
#' @examples
#' md_heading("Overview")
#' md_heading(x = c("One", "Two"), level = 1:2)
#' md_heading(x = c("Installation", "Usage"), level = 2)
#' @importFrom glue glue
#' @export
md_heading <- function(x, level = 1) {
  if (max(level) > 6 | min(level) < 1) {
    stop("ATX headings only support levels 1 through 6.")
  }
  glue::glue("{strrep('#', level)} {x}")
}

#' Markdown Setext headings (4.3)
#'
#' Turn a character vector into a vector of valid markdown Setext headings.
#' These markdown leaf blocks can be rendered as the `<h1>` and `<h2>` tags
#' _only_.
#'
#' @details
#' A setext heading consists of one or more lines of text, each containing at
#' least one non-whitespace character, with no more than 3 spaces indentation,
#' followed by a setext heading underline. The lines of text must be such that,
#' were they not followed by the setext heading underline, they would be
#' interpreted as a paragraph: they cannot be interpretable as a
#' [code fence](https://github.github.com/gfm/#code-fence),
#' [ATX heading](https://github.github.com/gfm/#atx-headings),
#' [block quote](https://github.github.com/gfm/#block-quotes),
#' [thematic break](https://github.github.com/gfm/#thematic-breaks),
#' [list item](https://github.github.com/gfm/#list-items), or
#' [HTML block.](https://github.github.com/gfm/#html-blocks)
#'
#' A setext heading underline is a sequence of `=` characters or a sequence of
#' `-` characters, with no more than 3 spaces indentation and any number of
#' trailing spaces. If a line containing a single `-` can be interpreted as an
#' empty list items, it should be interpreted this way and not as a setext
#' heading underline.
#'
#' The heading is a level 1 heading if `=` characters are used in the setext
#' heading underline, and a level 2 heading if `-` characters are used. The
#' contents of the heading are the result of parsing the preceding lines of text
#' as CommonMark inline content.
#'
#' In general, a setext heading need not be preceded or followed by a blank
#' line. However, it cannot interrupt a paragraph, so when a setext heading
#' comes after a paragraph, a blank line is needed between them.
#' @param x A character vector of heading text.
#' @param level An numeric vector of all either 1 or 2 to determine whether
#'   level 1 headings are created with `=` or level two with `-`. If less levels
#'   are provided than headings, `level` will be repeated via [glue::glue()].
#' @param width logical or integer; if `TRUE` the width will be automatically
#'   determined by the width of the longest line in `x`. If an integer, the
#'   setext underline will be that wide.
#' @return A `glue` vector of headings with length equal to `x`.
#' @importFrom glue glue glue_collapse
#' @family leaf block functions
#' @examples
#' md_setext("Overview")
#' md_setext("This is a setext\nheading", level = 2)
#' md_setext(c("one", "two", "three", "four"), level = c(1, 2))
#' md_setext("Installation", level = 2, width = 55)
#' @export
md_setext <- function(x, level = 1, width = TRUE) {
  if (any(x == "")) {
    stop("Setext headings cannot be empty.")
  }
  char <- if (max(level) > 2 | min(level) < 1) {
    stop("Setext headings only support levels 1 and 2.")
  } else {
    char <- c("=", "-")[level]
  }
  n <- if ((all(is.logical(width)) & isTRUE(width)) | min(width) < 1) {
    vapply(strsplit(x, "\n"), function(y) max(nchar(y)), FUN.VALUE = integer(1))
  } else {
    width
  }
  glue::glue("{x}\n{strrep(char, n)}")
}
