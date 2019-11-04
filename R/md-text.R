#' Markdown textual content
#'
#' Simple wrapper around [glue::as_glue()]. Take a character vector and return a
#' glue vector.
#'
#' @details
#' Any characters not given an interpretation by the \[other\] rules will be
#' parsed as plain textual content.
#' @param x A character vector.
#' @return A `glue` vector.
#' @family inline functions
#' @examples
#' md_text("foo")
#' @importFrom glue as_glue
#' @export
md_text <- function(x) {
  glue::as_glue(x)
}
