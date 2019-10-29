#' @title Selective Markdown Emphasize
#' @param x A vector of sentence character strings.
#' @param n The numeric _position_ of the word in each sentence to emphasize.
#' @param f An emphasizing function (e.g., [md_bold()]).
#' @return A character vector with elements wrapped in two tilde symbols.
#' @examples
#' emphasize_at(x = "Live free or die", n = 4, f = md_bold)
#' @importFrom stringr str_c str_split
#' @importFrom purrr map_at
#' @export
emphasize_at <- function(x, f, n) {
  s <- stringr::str_split(x, pattern = " ")
  for (i in seq_along(s)) {
    s2 <- purrr::map_at(.x = s[[i]], .at = n, .f = f)
    s[[i]] <- stringr::str_c(s2, collapse = " ")
  }
  unlist(s)
}

#' @title Markdown Bold Emphasis
#' @param x The text to be emphasized in bold.
#' @return A character vector with elements wrapped in two asterisk symbols.
#' @family inline functions
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
#' @family inline functions
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
#' @family inline functions
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
#' @family inline functions
#' @examples
#' md_strike("Example")
#' md_strike(state.name)
#' @importFrom glue glue
#' @export
md_strike <- function(x) {
  glue::glue("~~{x}~~")
}
