#' @title Selective Markdown Emphasize
#' @param x A vector of sentence character strings.
#' @param f An emphasizing function (e.g., [md_bold()]).
#' @param n The numeric _position_ of the word in each sentence to emphasize.
#' @return A character vector with elements wrapped in two tilde symbols.
#' @examples
#' emphasize_at(x = "Live free or die", f = md_bold, n = 4)
#' @importFrom stringr str_c str_split
#' @importFrom purrr map_at
#' @export
emphasize_at <- function(x, f, n) {
  # hacky solution
  emphasize_at <- function(.x, .at, .f) {
    stringr::str_c(purrr::map_at(.x, .at, .f), collapse = " ")
  }
  s <- stringr::str_split(x, pattern = " ")
  for (i in seq_along(s)) {
    s[[i]] <- emphasize_at(s[[i]], n, f)
  }
  unlist(s)
}

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
#' @param x The text to be formatted as fixed-width inline code.
#' @return A character vector with elements wrapped in backtick symbols.
#' @examples
#' md_code("ex_var")
#' md_code(state.name)
#' @importFrom glue glue
#' @export
md_code <- function(x) {
  glue::glue("`{x}`")
}

#' @title Markdown Strikethrough Emphasis
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
