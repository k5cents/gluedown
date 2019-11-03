#' Markdown autolink
#'
#' Take a character vector and wrap each element in `<` and `>` to return a glue
#' vector of autolink text. This inline is rendered as the `<href>` HTML tag.
#'
#' @details
#' Autolinks are absolute URIs and email addresses inside `<` and `>`. They are
#' parsed as links, with the URL or email address as the link label.
#'
#' A URI autolink consists of `<`, followed by an absolute URI followed by `>`.
#' It is parsed as a link to the URI, with the URI as the link’s label.
#'
#' An absolute URI, for these purposes, consists of a scheme followed by a colon
#' (`:`) followed by zero or more characters other than ASCII whitespace and
#' control characters, `<`, and `>`. If the URI includes these characters, they
#' must be percent-encoded (e.g. `%20` for a space).
#'
#' For purposes of this spec, a scheme is any sequence of 2–32 characters
#' beginning with an ASCII letter and followed by any combination of ASCII
#' letters, digits, or the symbols plus (”+”), period (”.”), or hyphen (”-”).
#' @param url A character vector of absolute URLs.
#' @return A `glue` vector of length equal to `x`.
#' @family inline functions
#' @examples
#' md_autolink("http://foo.bar.baz")
#' @importFrom glue glue
#' @export
md_autolink <- function(url) {
  glue::glue("<{url}>")
}
