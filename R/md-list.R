#' Markdown generic list
#'
#' Turn a character vector into a valid markdown list block. This is a generic
#' function that calls [md_bullet()], [md_order()], or [md_task()] depending on
#' what string is provided in the `type` argument.
#'
#' @param x A character vector of list items.
#' @param type The type of list to create; either bullet, ordered, or task.
#' @param ... Arguments passed to the appropriate list type function.
#' @return A `glue` vector with length equal to `x`.
#' @family container block functions
#' @examples
#' md_list(state.name[1:5], type = "bullet", marker = "+")
#' md_list(state.name[6:10], type = "ordered", marker = ")")
#' md_list(state.name[11:15], type = "task", check = 3:5)
#' @export
md_list <- function(x, type = c("bullet", "ordered", "task"), ...) {
  type <- match.arg(type)
  if (type == "bullet") {
    md_bullet(x, ...)
  } else {
    if (type == "ordered") {
      md_order(x, ...)
    } else {
      md_task(x, ...)
    }
  }
}

#' Markdown bullet list
#'
#' take a character vector and return a glue vector of valid bullet list items.
#' When printed together, these bullet list items create a bullet list. This
#' container block is rendered as the `<ul>` HTML tag, with each element of the
#' vector creating a separate `<li>` tag.
#'
#' @details
#' A list is a sequence of one or more list items of the same type. The list
#' items may be separated by any number of blank lines.
#'
#' Two list items are of the same type if they begin with a list marker of the
#' same type. Two list markers are of the same type if (a) they are bullet list
#' markers using the same character (`-`, `+`, or `*`)...
#' @param x The vector of bullet point list items.
#' @param marker The bullet list marker to use; one of `-`, `+`, or `*`.
#' @return A `glue` vector with length equal to `x`.
#' @family container block functions
#' @examples
#' md_bullet(state.name[1:5])
#' md_bullet(sample(state.name, 5), marker = "+")
#' @importFrom glue glue
#' @export
md_bullet <- function(x, marker = c("*", "-", "+")) {
  marker <- match.arg(marker)
  glue::glue("{marker} {x}")
}

#' Markdown ordered list
#'
#' take a character vector and return a glue vector of valid ordered list items.
#' When printed together, these ordered list items create a ordered list. This
#' container block is rendered as the `<ol>` HTML tag, with each element of the
#' vector creating a separate `<li>` tag.
#'
#' @details
#' A list is a sequence of one or more list items of the same type. The list
#' items may be separated by any number of blank lines.
#'
#' Two list items are of the same type if they begin with a list marker of the
#' same type. Two list markers are of the same type if (b) they are ordered list
#' numbers with the same delimiter (either `.` or `)`).
#'
#' A list is an ordered list if its constituent list items begin with ordered
#' list markers, and a bullet list if its constituent list items begin with
#' bullet list markers.
#'
#' The start number of an ordered list is determined by the list number of its
#' initial list item. The numbers of subsequent list items are disregarded.
#' @param x The vector of numbered list items.
#' @param seq logical; Should sequential numbers be used? Defaults to `TRUE`. If
#'   `FALSE`, each element will be preceded by the number one; many markdown
#'   engines will automatically render repeated ones as a sequential list.
#' @param pad logical; If sequential numbers are used, should they be padded
#'   with zeroes on the left to match the width of the greatest number? Defaults
#'   to `TRUE`.
#' @param marker The ordered list marker following each arabic digits; either
#'   `.` or `)`.
#' @return A `glue` vector with length equal to `x`.
#' @family container block functions
#' @examples
#' md_order(state.name[1:5])
#' md_order(sample(state.name, 5), marker = ")")
#' md_order(sample(state.name, 5), seq = FALSE)
#' @importFrom glue glue
#' @export
md_order <- function(x, marker = c(".", ")"), seq = TRUE, pad = TRUE) {
  marker <- match.arg(marker)
  if (seq) {
    nums <- seq_along(x)
    if (pad) {
      width <- max(nchar(nums))
      nums <- sprintf(glue::glue("%0{width}d"), nums)
    }
  } else {
    nums <- 1
  }
  glue::glue("{nums}{marker} {x}")
}

#' Markdown task list (extension)
#'
#' take a character vector and return a glue vector of valid bullet list items.
#' When printed together, these bullet list items create a bullet list. This
#' container block is rendered as the `<ul>` HTML tag, with each element of the
#' vector creating a separate `<li>` tag. On venues supporting GitHub Flavored
#' Markdown, this list will be specially rendered with the list item market
#' replaces with a `<input type="checkbox">` HTML tag.
#'
#' @details
#' GFM enables the tasklist extension, where an additional processing step is
#' performed on list items.
#'
#' A task list item is a list item where the first block in it is a paragraph
#' which begins with a task list item marker and at least one whitespace
#' character before any other content.
#'
#' A task list item marker consists of an optional number of spaces, a left
#' bracket, either a whitespace character or the letter `x` in either
#' lowercase or uppercase, and then a right bracket.
#'
#' When rendered, the task list item marker is replaced with a semantic checkbox
#' element; in an HTML output, this would be an `<input type="checkbox">`
#' element.
#'
#' If the character between the brackets is a whitespace character, the checkbox
#' is unchecked. Otherwise, the checkbox is checked.
#'
#' This spec does not define how the checkbox elements are interacted with: in
#' practice, implementors are free to render the checkboxes as disabled or
#' inmutable elements, or they may dynamically handle dynamic interactions (i.e.
#' checking, unchecking) in the final rendered document.
#' @param x A character vector of task list items.
#' @param check A optional numeric vector of list elements which should be
#'   checked off.
#' @return A `glue` vector with length equal to `x`.
#' @family container block functions
#' @examples
#' md_task(c("Wake up", "Eat Breakfast", "Brush Teeth"), check = c(1, 3))
#' @importFrom glue glue
#' @export
md_task <- function(x, check = NULL) {
  boxes <- rep("* [ ]", length(x))
  if (!is.null(check)) {
    boxes[check] <- "* [x]"
  }
  glue::glue("{boxes} {x}")
}
