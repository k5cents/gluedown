#' @title Output Separated Markdown
#' @param x The markdown text to concatenate and separate with newlines.
#' @return A character vector with elements wrapped in a single dollar sign.
#' @examples
#' md_cat(md_list(c("one", "two")))
#' @export
md_cat <- function(x) {
  cat(x, sep = "\n")
}
