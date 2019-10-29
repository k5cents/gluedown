#' @title Markdown code span (6.3)
#' @description Code spaces emphasize a section of text within a markdown block.
#'   This inline is rendered as a `<code>` HTML tag, which displays text in
#'   a fixed-width font. Code spans are commonly used to represent variables,
#'   packages, functions, or snippets of small code.
#' @details A backtick string is a string of one or more backtick characters
#'   that is neither preceded nor followed by a backtick.
#'
#'   A code span begins with a backtick string and ends with a backtick string of
#'   equal length. The contents of the code span are the characters between the
#'   two backtick strings, normalized in the following ways:
#'   * First, line endings are converted to spaces.
#'   * If the resulting string both begins and ends with a space character, but
#'   does not consist entirely of space characters, a single space character is
#'   removed from the front and back. This allows you to include code that begins
#'   or ends with backtick characters, which must be separated by whitespace from
#'   the opening or closing backtick strings.
#'
#' @param x The text to be formatted as fixed-width inline code.
#' @return A `glue` vector of length equal to `x`.
#' @family inline functions
#' @examples
#' md_code("ex_var")
#' md_code(state.name[1:3])
#' @importFrom glue glue
#' @export
md_code <- function(x) {
  glue::glue("`{x}`")
}

#' @title Markdown strong/bold emphasis (6.4)
#' @description Turn a character vector into a vector of valid strong emphasis
#'   markdown inline text. This inline text can then be rendered as the
#'   `<stong>` HTML tag. Right now, this package uses double `**` for strong
#'   emphasis, although double `__` meets the GFM spec.
#' @details A double `**` or `__` can open or close emphasis... Emphasis begins
#'   with a delimiter that can open emphasis and ends with a delimiter that can
#'   close emphasis, and that uses the same character (`__` or `**`) as the
#'   opening delimiter.
#' @param x The text to be emphasized in bold.
#' @return A `glue` vector of length equal to `x`.
#' @family inline functions
#' @examples
#' md_bold("Example")
#' md_bold(state.name)
#' @importFrom glue glue
#' @export
md_bold <- function(x) {
  glue::glue("**{x}**")
}

#' @title Markdown italic emphasis (6.4)
#' @description Turn a character vector into a vector of valid italic emphasis
#'   markdown inline text. This inline text can then be rendered as the `<em>`
#'   HTML tag. Right now, this package uses sinlge `_` for strong emphasis,
#'   although single `*` meets the GFM spec.
#' @details A single `*` or `_` can open or close emphasis... Emphasis begins
#'   with a delimiter that can open emphasis and ends with a delimiter that can
#'   close emphasis, and that uses the same character (`_` or `*`) as the
#'   opening delimiter.
#' @param x The text to be emphasized in italics.
#' @return A `glue` vector of length equal to `x`.
#' @family inline functions
#' @examples
#' md_italic("Example")
#' md_italic(state.name)
#' @importFrom glue glue
#' @export
md_italic <- function(x) {
  glue::glue("_{x}_")
}

#' @title Markdown strikethrough (6.5 extension)
#' @details GFM enables the strikethrough extension, where an additional
#'   emphasis type is available.
#'
#'   Strikethrough text is any text wrapped in two tildes (`~`).
#' @param x A character vector of text to be striked through.
#' @return A `glue` vector of length equal to `x`.
#' @family inline functions
#' @family markdown extensions
#' @examples
#' md_strike("Example")
#' md_strike(state.name[1:3])
#' @importFrom glue glue
#' @export
md_strike <- function(x) {
  glue::glue("~~{x}~~")
}
