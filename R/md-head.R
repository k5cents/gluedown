#' @title Markdown ATX Headings
#' @description Form a vector of markdown headings.
#' @details From the [GFM spec](https://github.github.com/gfm/#atx-heading): An ATX heading
#'   consists of a string of characters, parsed as inline content, between an opening sequence of
#'   1–6 unescaped `#` characters… The opening sequence of `#` characters must be followed by a
#'   space or by the end of line… The heading level is equal to the number of `#` characters in the
#'   opening sequence.
#' @param x The text of the headings.
#' @param level The number of header hash characters. The heading level is equal
#'   to the number of # characters in the opening sequence. In rendered markdown
#'   higher levels are typically displayed larger.
#' @param cat logical; Should the list be concatenated and printed, with each
#'   bullet element separated by a new line? Defaults to `FALSE`.
#' @return A character vector with elements preceded by hash symbols.
#' @importFrom glue glue_collapse
#' @examples
#' md_head("Overview")
#' md_head(c("Installation", "Development version"), level = 1:2)
#' @export
md_head <- function(x, level = 1, cat = FALSE) {
  if (max(level) > 6) {
    stop("More than 6 #'s is not a valid markdown heading.")
  }
  hashes <- rep(NA, length(level))
  for (i in seq_along(hashes)) {
    hashes[i] <- glue::glue_collapse(rep("#", level[i]))
  }
  heading <- paste(hashes, x)
  if_cat(heading, cat)
}
