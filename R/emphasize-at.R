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
