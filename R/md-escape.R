#' Backslash escape all punctuation
#'
#' Take a character vector containing punctuation and return a glue vector with
#' every punctuation mark prepended with double escape backslashes.
#'
#' When trying to format text containing markdown syntax characters, it's
#' necessary to "escape" those characters so that they are ignored by
#' formatting.
#'
#' @details
#' Any ASCII punctuation character may be backslash-escaped... Escaped
#' characters are treated as regular characters and do not have their usual
#' Markdown meanings.
#' @param x A character vector of strings containing punctuation that might
#'   accidentally be considered markdown syntax.
#' @return A character string with all `[:punct:]` properly escaped with
#'   prepended backslashes.
#' @family inline functions
#' @examples
#' md_escape("# six seasons and a movie")
#' @importFrom glue as_glue
#' @export
md_escape <- function(x) {
  glue::as_glue(gsub(pattern = "([[:punct:]])", replacement = "\\\\\\1", x))
}
