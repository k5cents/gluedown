#' @title Output Separated Markdown
#' @param x The markdown text to concatenate and separate with newlines.
#' @return A single character vector formatted for printing.
md_cat <- function(x) {
  cat(x, sep = "\n")
}

#' @title Output if Desired
#' @param x The wrapped vector from a parent function.
#' @param cat The `cat` argument from a parent function.
#' @return A single character vector formatted for printing.
if_cat <- function(x, cat) {
  if (cat) {
    md_cat(x)
  } else {
    return(x)
  }
}

