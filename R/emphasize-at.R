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
#' emphasize_at("Live free or die", n = 4, f = md_bold)
#' emphasize_at(stringr::sentences[1:10], n = 2, f = md_italic)
#' @importFrom stringr str_c str_split
#' @importFrom purrr map_at
#' @export
emphasize_at <- function(x, f, n) {
  s <- stringr::str_split(x, pattern = " ")
  for (i in seq_along(s)) {
    s2 <- purrr::map_at(.x = s[[i]], .at = n, .f = f)
    s[[i]] <- stringr::str_c(s2, collapse = " ")
  }
  glue::as_glue(unlist(s))
}


