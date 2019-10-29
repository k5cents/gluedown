#' @title Markdown ATX Headings
#' @description Form a vector of markdown headings.
#' @details From the [GFM spec](https://github.github.com/gfm/#atx-heading): An
#'   ATX heading consists of a string of characters, parsed as inline content,
#'   between an opening sequence of 1–6 unescaped `#` characters… The opening
#'   sequence of `#` characters must be followed by a space or by the end of
#'   line… The heading level is equal to the number of `#` characters in the
#'   opening sequence.
#' @param x The text of the headings.
#' @param level The number of header hash characters. The heading level is equal
#'   to the number of # characters in the opening sequence. In rendered markdown
#'   higher levels are typically displayed larger.
#' @return A character vector with elements preceded by hash symbols.
#' @importFrom glue glue_collapse
#' @family leaf block functions
#' @examples
#' md_heading("Overview")
#' md_heading(c("Installation", "Development version"), level = 1:2)
#' @export
md_heading <- function(x, level = 1) {
  if (max(level) > 6) {
    stop("More than 6 #'s is not a valid markdown heading.")
  }
  hashes <- rep(NA, length(level))
  for (i in seq_along(hashes)) {
    hashes[i] <- glue::glue_collapse(rep("#", level[i]))
  }
  glue::glue("{hashes} {x}")
}

#' @title Markdown Setext Headings
#' @description Form a single level 1 or 2 markdown setext headings.
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
#' @param x The text of the headings.
#' @param level The heading level created; level 1 uses `=` and level 2 or
#'   greater uses `-`.
#' @return A heading with a setext underline the width of the longest line in `x`.
#' @importFrom glue glue glue_collapse
#' @family leaf block functions
#' @examples
#' md_setext("Overview")
#' md_setext("This is a setext\nHeading", level = 2)
#' md_setext(c("one", "two", "three"), c(1, 2, 1))
#' @export
md_setext <- function(x, level = 1) {
  if (length(x) != length(level)) {
    stop("A level must be supplied for every element of x.")
  }
  char <- rep(NA, length(level))
  for (i in seq_along(level)) {
    char[i] <- if (level[i] > 2) {
      warning("Setext headings do not support levels greater than 2.")
      "-"
    } else {
      if (level[i] == 1) {
        "="
      } else {
        "-"
      }
    }
  }
  width <- sapply(strsplit(x, "\n"), function(y) max(nchar(y)))
  lines <- rep(NA, length(x))
  for (j in seq_along(x)) {
    lines[j] <- glue::glue_collapse(rep(char[j], width[j]))
  }
  glue::glue("{x}\n{lines}")
}
