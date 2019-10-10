#' @title Markdown Bold Emphasis
#' @param x The text to be emphasized in bold.
#' @return A character vector with elements wrapped in two asterisk symbols.
#' @examples
#' md_bold("Example")
#' md_bold(state.name)
#' @importFrom glue glue
#' @export
md_bold <- function(x) {
  glue::glue("**{x}**")
}

#' @title Markdown Italic Emphasis
#' @param x The text to be emphasized in italics.
#' @return A character vector with elements wrapped in underscore symbols.
#' @examples
#' md_italic("Example")
#' md_italic(state.name)
#' @importFrom glue glue
#' @export
md_italic <- function(x) {
  glue::glue("_{x}_")
}

#' @title Markdown Inline Code
#' @param x The text to be formatted as inline code.
#' @return A character vector with elements wrapped in backtick symbols.
#' @examples
#' md_inline("ex_var")
#' md_inline(state.name)
#' @importFrom glue glue
#' @export
md_inline <- function(x) {
  glue::glue("`{x}`")
}

#' @title Markdown Strikethough Emphasis
#' @param x The text to be striked though.
#' @return A character vector with elements wrapped in two tilde symbols.
#' @examples
#' md_strike("Example")
#' md_strike(state.name)
#' @importFrom glue glue
#' @export
md_strike <- function(x) {
  glue::glue("~~{x}~~")
}
