#' @title Targeted markdown formatting
#' @description Split a sentence by whitespace and wrap a specific word(s) in a
#'   markdown inline function.
#' @param x A character vector of strings containing words separated by spaces.
#' @param f An emphasizing inline function (e.g., [md_bold()]).
#' @param n A numeric vector describing the positions of the words in `x` to be
#'   emphasized with `f`.
#' @return A `glue` vector of length equal to `x` with the `n`th word
#'   formatted using `f`.
#' @examples
#' map_md("Live free or die", n = 4, f = md_bold)
#' map_md(stringr::sentences[1:3], n = 2, f = md_italic)
#' map_md(stringr::sentences[4:6], n = 2:3, f = md_italic)
#' @importFrom stringr str_split str_trim str_c
#' @export
map_md <- function(x, f, n) {
  if (class(f) != "function") {
    stop("f must be a function, typically one from the inline family.")
  }
  s <- stringr::str_split(x, pattern = "\\s", simplify = TRUE)
  s[, n] <- f(s[, n])
  glue::as_glue(stringr::str_trim(apply(X = s, MARGIN = 1, stringr::str_c, collapse = " ")))
}
