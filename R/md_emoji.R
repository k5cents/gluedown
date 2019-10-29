#' @title Markdown emoji (unsupported extension)
#' @description Replace an emoji text code with it's UTF-8 counterpart.
#' @param x A character vector containing emoji codes in the format of `:code:`.
#' @return A `glue` vector of emoji?
#' @examples
#' md_emoji(":sunglasses:")
#' md_emoji(c(":man_technologist:", ":arrow_down:"))
#' @importFrom glue glue
#' @export
md_emoji <- function(x) {
  # use hadley/emo?
  glue::as_glue(
    stringr::str_replace_all(
      string = x,
      pattern = gluedown::emoji_codes
    )
  )
}
