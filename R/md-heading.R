#' @title Markdown ATX headings (4.2)
#' @description Turn a character vector into a vector of valid markdown ATX
#'   headings. These markdown leaf blocks can be rendered as the `<h1>` through
#'   `<h6>` HTML tags. See [md_setext()] to create setext (underlined) headings.
#' @details From the [GFM spec](https://github.github.com/gfm/#atx-heading): An
#'   ATX heading consists of a string of characters, parsed as inline content,
#'   between an opening sequence of 1–6 unescaped `#` characters... The opening
#'   sequence of `#` characters must be followed by a space or by the end of
#'   line... The heading level is equal to the number of `#` characters in the
#'   opening sequence.
#' @param x A character vector of heading text.
#' @param level A numeric vector of use to determine the number of heading hash
#'   characters to preceed each element of `x`. The heading level is equal to
#'   the number of `#` characters in the opening sequence.
#' @return A `glue` vector of a length equal to `x`.
#' @family leaf block functions
#' @examples
#' md_heading("Overview")
#' md_heading(x = c("One", "Two"), level = 1:2)
#' md_heading(x = c("Installation", "Usage"), level = 2)
#' @importFrom glue glue
#' @importFrom stringr str_dup
#' @export
md_heading <- function(x, level = 1) {
  if (max(level) > 6 | min(level) < 1) {
    stop("ATX headings only support levels 1 through 6.")
  }
  glue::glue("{stringr::str_dup('#', level)} {x}")
}

#' @title Markdown Setext headings (4.3)
#' @description Turn a character vector into a vector of valid markdown Setext
#'   headings. These markdown leaf blocks can be rendered as the `<h1>` and
#'   `<h2>` tags _only_.
#' @details From the [GFM spec](https://github.github.com/gfm/#setext-headings):
#'   A setext heading consists of one or more lines of text, each containing at
#'   least one [non-whitespace character](https://github.github.com/gfm/#non-whitespace-character),
#'   with no more than 3 spaces indentation,
#'   followed by a [setext heading underline](https://github.github.com/gfm/#setext-heading-underline)...
#'   A setext heading underline is a sequence of `=` characters or a sequence of
#'   `-` characters, with no more than 3 spaces indentation and any number of
#'   trailing spaces... The heading is a level 1 heading if `=` characters are
#'   used in the setext heading underline, and a level 2 heading if `-`
#'   characters are used.
#' @param x A character vector of heading text.
#' @param level A numeric vector of use to determine the number of heading hash
#'   characters to preceed each element of `x`. The heading level is equal to
#'   the number of `#` characters in the opening sequence.
#' @return A `glue` vector of a length equal to `x`.
#' @importFrom glue glue glue_collapse
#' @family leaf block functions
#' @examples
#' md_setext("Overview")
#' md_setext("This is a setext\nheading", level = 2)
#' md_setext(c("one", "two", "three", "four"), level = c(1, 2))
#' @export
md_setext <- function(x, level = 1) {
  char <- if (max(level) > 2 | min(level) < 1) {
    stop("Setext headings only support levels 1 and 2.")
  } else {
    char <- c("=", "-")[level]
  }

  width <- sapply(strsplit(x, "\n"), function(y) max(nchar(y)))
  glue::glue("{x}\n{stringr::str_dup(char, width)}")
}
