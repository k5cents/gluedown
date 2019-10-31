#' Markdown tables (4.10 extension)
#'
#' Take a list of data frames or matrices and pass them to [knitr::kable()] to
#' create a glue vector containing valid markdown tables.
#'
#' @details
#' FM enables the `table` extension, where an additional leaf block type is
#' available.
#'
#' A table is an arrangement of data with rows and columns, consisting of a
#' single header row, a delimiter row separating the header from the data, and
#' zero or more data rows.
#'
#' Each row consists of cells containing arbitrary text, in which
#' [inlines](https://github.github.com/gfm/#inline) are parsed, separated by
#' pipes (`|`). A leading and trailing pipe is also recommended for clarity of
#' reading, and if there’s otherwise parsing ambiguity. Spaces between pipes and
#' cell content are trimmed. Block-level elements cannot be inserted in a table.
#'
#' The delimiter row consists of cells whose only content are hyphens (`-`), and
#' optionally, a leading or trailing colon (`:`), or both, to indicate left,
#' right, or center alignment respectively (see `align` in [knitr::kable()]).
#' @param x An `R` object to be formatted as a table.
#' @param ... Arguments passed to [knitr::kable()]
#' @return A `glue` vector of length one, with each element or row of `x`
#'  separated by a newline.
#' @family leaf block functions
#' @family markdown extensions
#' @examples
#' md_table(mtcars)
#' md_table(data.frame(x = LETTERS[1:3], y = 1:3), align = c("cc"))
#' @importFrom knitr kable
#' @importFrom glue glue_collapse
#' @export
md_table <- function(x, ...) {
  table <- knitr::kable(x, format = "markdown", ...)
  glue::glue_collapse(table, sep = "\n")
}
