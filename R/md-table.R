#' @title Markdown Tables
#' @description Wraps around the [knitr::kable()] function.
#' @details From the [GFM spec](https://github.github.com/gfm/#table): A table is an arrangement of
#'   data with rows and columns, consisting of a single header row, a
#'   [delimiter row](https://github.github.com/gfm/#delimiter-row) separating the
#'   header from the data, and zero or more data rows... Each row consists of cells containing
#'   arbitrary text, in which [inlines](https://github.github.com/gfm/#inline) are parsed,
#'   separated by pipes (`|`). A leading and trailing pipe is also recommended for clarity of
#'   reading, and if there’s otherwise parsing ambiguity. Spaces between pipes and cell content are
#'   trimmed. Block-level elements cannot be inserted in a table. The delimiter row consists of
#'   cells whose only content are hyphens (`-`), and optionally, a leading or trailing colon (`:`),
#'   or both, to indicate left, right, or center alignment respectively.
#' @param df A data frame to be formatted as table.
#' @param ... Arguments passed to [knitr::kable()]
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
