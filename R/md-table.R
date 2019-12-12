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
#' @importFrom glue glue_collapse
#' @export
md_table <- function(x, ...) {
  if (requireNamespace("knitr", quietly = TRUE)) {
    table <- knitr::kable(x, format = "markdown", ...)
  } else {
    x <- as.matrix(x)
    x <- rbind(colnames(x), x)
    x <- cbind(rownames(x), x)
    x[is.na(x)] <- "NA"
    if (nrow(x) >= 2) {
      x <- apply(x, 2, function(z) sprintf(glue::glue("%-{max(nchar(z))}s"), z))
    }
    s <- strrep("-", apply(x, 2, function(z) max(nchar(z))))
    if (nrow(x) >= 2) {
      x <- rbind(x[1, ], s, x[2:nrow(x), ])
    } else {
      x <- rbind(x[1, ], s)
    }
    x <- cbind("", x, "")
    table <- trimws(apply(x, 1, paste, collapse = " | "))
  }
  glue::glue_collapse(table, sep = "\n")
}
