#' @title Markdown Code Block
#' @description Wrap a character vector (possibly lines of a file) in code
#'   fences to be rendered as a code block.
#' @details From the [GFM spec](https://github.github.com/gfm/#code-fence): A
#'   code fence is a sequence of at least three consecutive backtick characters…
#'   A fenced code block begins with a code fence, indented no more than three
#'   spaces… The line with the opening code fence may optionally contain some
#'   text following the code fence… The content of the code block consists of
#'   all subsequent lines, until a closing code fence… The content of a code
#'   fence is treated as literal text, not parsed as inlines. The first word of
#'   the info string is typically used to specify the language of the code
#'   sample
#' @param lines A character vector of lines to
#'   be wrapped in fences, possibly created by [readr::read_lines()] or some
#'   equivalent.
#' @param lang The language of the code within the fence. Aside from clarity,
#'   this allows many markdown engines to adjust the syntax highlighting.
#'   Defaults to "r". This option is not used with indented blocks.
#' @param type The type of code block to be created. Defaults to tipple
#'   backticks code fences, but you can also use 4-spaces (useful for legacy
#'   support on Reddit).
#' @param style logical; If the `styler` package is installed, should
#'   [styler::style_text()] be called on `lines`?
#' @return A character vector wrapped on either side by code fences.
#' @examples
#' md_chunk(c("library(ggplot2)", "ggplot(mpg)+", "geom_point(aes(displ, hwy))"))
#' md_chunk(c("library(dplyr)", "starwars %>%", "filter(species == 'Droid')"), type = "indent")
#' @export
md_chunk <- function(lines, lang = "r", type = c("tick", "tilde", "indent"), style = TRUE) {
  if (style & !requireNamespace("styler", quietly = FALSE)) {
    stop("To style, the styler package needs to be installed with install.packages('styler')")
  }
  type <- match.arg(type)
  fence <- if (type == "tick") {
    "```"
  } else {
    "~~~"
  }
  if (type == "tick" | type == "tilde") {
    string <- paste(lines, collapse = "\n")
    if (style) {
      styled <- paste(styler::style_text(string), collapse = "\n")
      glue("{fence}{lang}\n{styled}\n{fence}")
    } else {
      glue("{fence}{lang}\n{string}\n{fence}")
    }
  } else {
    if (style) {
      string <- paste(lines, collapse = "\n")
      styled <- styler::style_text(string)
      glue("    {styled}")
    } else {
      glue("    {lines}")
    }
  }
}
