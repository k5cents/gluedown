#' @title Markdown Tables
#' @description Wraps around the [knitr::kable()] function.
#' @param df A data frame to be formatted as table.
#' @return A character vector of markdown table source code.
#' @examples
#' md_table(ggplot2::presidential)
#' @importFrom knitr kable
#' @export
md_table <- function(df, ...) {
  knitr::kable(
    x = df,
    format = "markdown",
    ...
  )
}
