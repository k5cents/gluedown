#' @title Markdown Bullet List
#' @description Form a single-level unordered list from a vector.
#' @details From the [GFM spec](https://github.github.com/gfm/#bullet-list-marker):
#'   A bullet list marker is a `-`, `+`, or `*` character.
#' @param x The vector of bullet point list items.
#' @param marker The bullet list marker to use.
#' @return A character vector with elements preceded by an asterisk symbol.
#' @examples
#' md_bullet(state.name[1:5])
#' md_bullet(state.name[1:5])
#' @export
md_bullet <- function(x, marker = c("*", "-", "+")) {
  marker <- match.arg(marker)
  glue::glue("{marker} {x}")
}

#' @title Markdown Numbered List
#' @description Form a single-level ordered list from a vector.
#' @details From the [GFM spec](https://github.github.com/gfm/#ordered-list-marker):
#'   An ordered list marker is a sequence of 1–9 arabic digits (`0-9`), followed
#'   by either a `.` character or a `)` character.
#' @param x The vector of numbered list items.
#' @param seq logical; Should sequential numbers be used? Defaults to `TRUE`. If
#'   `FALSE`, each element will be preceded by the number one; many markdown
#'   engines will automatically render repeated ones as a sequential list.
#' @param pad logical; If sequential numbers are used, should they be padded
#'   with zeroes on the left to match the width of the greatest number? Defaults
#'   to `TRUE`.
#' @param punct The punctuation mark following each number; either `.` or `)`.
#' @return A character vector with elements preceded by a number.
#' @examples
#' md_list(state.name[1:5])
#' md_list(state.name[1:5])
#' @importFrom stringr str_pad
#' @export
md_list <- function(x, seq = TRUE, pad = TRUE, punct = c(".", ")")) {
  punct <- match.arg(punct)
  if (nchar(length(x)) > 9) {
    stop("A maximum of 9 digits can be used as an unordered list marker. Your vector is too long.")
  }
  if (seq) {
    nums <- seq_along(x)
    if (pad) {
      nums <- stringr::str_pad(
        string = nums,
        side = "left",
        width = max(nchar(nums)),
        pad = "0"
      )
    }
  } else {
    nums <- 1
  }
  glue::glue("{nums}{punct} {x}")
}

#' @title Markdown Task List
#' @description Create a markdown task list from a vector of tasks. Define which
#'   task items should be checked off. Task lists are a GitHub specific markdown
#'   feature.
#' @details From the [GFM spec](https://github.github.com/gfm/#task-list-item):
#'   A task [list item](https://github.github.com/gfm/#list-items) is a list
#'   item where the first block in it is a paragraph which begins with a
#'   [task list item marker](https://github.github.com/gfm/#task-list-item-marker)
#'   and at least one whitespace character before any other content… A task list
#'   item marker consists of an optional number of spaces, a left bracket (`[`),
#'   either a whitespace character or the letter `x` in either lowercase or
#'   uppercase, and then a right bracket (`]`)… When rendered, the task list
#'   item marker is replaced with a semantic checkbox element… If the character
#'   between the brackets is a whitespace character, the checkbox is unchecked.
#'   Otherwise, the checkbox is checked.
#' @param x The vector of task list items.
#' @param check A vector of list elements which should be checked off.
#' @return A character vector check box brackets prepended to each element.
#' @examples
#' md_task(c("Wake up", "Eat Breakfast", "Brush Teeth"), check = 1:2)
#' @importFrom glue glue
#' @export
md_task <- function(x, check = NULL) {
  boxes <- rep("* [ ]", length(x))
  if (!is.null(check)) {
    boxes[check] <- "* [x]"
  }
  glue::glue("{boxes} {x}")
}
