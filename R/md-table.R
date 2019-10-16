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
#' md_table(mtcars)
#' @importFrom stringr str_c
#' @importFrom purrr as_vector
#' @export
md_table <- function(df, ...) {
  if (requireNamespace("knitr", quietly = TRUE)) {
    knitr::kable(
      x = df,
      format = "markdown",
      ...
    )
  } else {
    cols <- stringr::str_c(names(df), collapse = "|")
    sep <- stringr::str_c(rep(":----", ncol(df)) , collapse = "|")
    rows <- rep(NA, nrow(df))
    for (i in 1:nrow(df)) {
      rows[i] <- stringr::str_c(purrr::as_vector(df[i, ]) , collapse = "|")
    }
    cat(cols, sep, rows, sep = "\n")
  }
}
