#' @title Markdown Code Fence
#' @description Wrap a character vector (possibly lines of a file) in code fences to be rendered as
#'   a code block.
#' @details From the [GFM spec](https://github.github.com/gfm/#code-fence): A code fence is a
#'   sequence of at least three consecutive backtick characters… A fenced code block begins with a
#'   code fence, indented no more than three spaces… The line with the opening code fence may
#'   optionally contain some text following the code fence… The content of the code block consists
#'   of all subsequent lines, until a closing code fence… The content of a code fence is treated as
#'   literal text, not parsed as inlines. The first word of the info string is typically used to
#'   specify the language of the code sample
#' @param x A character vector of lines (with spaces for indentation) to be wrapped in fences.
#' @param lang The language of the code within the fence. Aside from clarity,
#'   this allows many markdown engines to adjust the syntax highlighting.
#'   Defaults to "R".
#' @param cat logical; Should the list be concatenated and printed, with each
#'   bullet element separated by a new line? Defaults to `TRUE`.
#' @return A character vector wrapped on either side by code fences.
#' @examples
#' md_fence(c("library(ggplot2)", "ggplot(data = mpg) +", "  geom_point((x = displ, y = hwy))"))
#' @export
md_fence <- function(x, lang = "r", cat = TRUE) {
  fence <- c(paste0("```", lang), x, "```")
  if_cat(fence, cat)
}
