#' @title Markdown Math Equations
#' @param x The text to formatted as math.
#' @return A character vector with elements wrapped in a single dollar sign.
#' @examples
#' md_math("1 + 1")
#' @importFrom glue glue
#' @export
md_math <- function(x) {
  glue("${x}$")
}
