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
#' @param x A character vector of lines (with leading spaces for indentation) to
#'   be wrapped in fences.
#' @param lang The language of the code within the fence. Aside from clarity,
#'   this allows many markdown engines to adjust the syntax highlighting.
#'   Defaults to "r". This option is not used with indented blocks.
#' @param type The type of code block to be created. Defaults to tipple
#'   backticks code fences, but you can also use 4-spaces (useful for legacy
#'   support on Reddit).
#' @param cat logical; Should the list be concatenated and printed, with each
#'   bullet element separated by a new line? Defaults to `TRUE`.
#' @return A character vector wrapped on either side by code fences.
#' @examples
#' md_chunk(c("library(ggplot2)", "ggplot(mpg) +", "  geom_point((displ, hwy))"))
#' @export
md_chunk <- function(x, lang = "r", type = c("ticks", "tilde", "indent"), cat = TRUE) {
  type <- match.arg(type)
  if (type == "ticks") {
    block <- c(paste0("```", lang), x, "```")
  } else {
    if (type == "tilde") {
      block <- c(paste0("~~~", lang), x, "~~~")
    } else {
      if (type == "indent") {
        block <- paste0("    ", x)
      }
    }
  }
  if_cat(block, cat)
}
