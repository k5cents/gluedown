#' @title Output Separated Markdown
#' @param x The markdown text to concatenate and separate with newlines.
#' @return A single character vector formatted for printing.
#' @examples
#' md_cat(md_list(c("one", "two")))
md_cat <- function(x) {
  cat(x, sep = "\n")
}
