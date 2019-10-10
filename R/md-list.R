#' @title Markdown Bullet List
#' @description Form a single-level unordered list from a vector.
#' @details From the [GFM spec](https://github.github.com/gfm/#bullet-list-marker): A bullet list
#'   marker is a `-`, `+`, or `*` character.
#' @param x The vector of bullet point list items.
#' @param cat logical; Should the list be concatenated and printed, with each
#'   bullet element separated by a new line? Defaults to `FALSE`.
#' @return A character vector with elements preceded by an asterisk symbol.
#' @examples
#' md_bullet(state.name)
#' md_bullet(state.name, cat = TRUE)
#' @export
md_bullet <- function(x, cat = FALSE) {
  list <- paste("*", x)
  if (cat) {
    cat(list, sep = "\n")
  } else {
    return(list)
  }}

#' @title Markdown Numered List
#' @description Form a single-level ordered list from a vector.
#' @details From the [GFM spec](https://github.github.com/gfm/#ordered-list-marker): An ordered
#'   list marker is a sequence of 1–9 arabic digits (`0-9`), followed by either a `.` character or
#'   a `)` character.
#' @param x The vector of numbered list items.
#' @param seq logical; Should sequential numbers be used? Defaults to `TRUE`. If
#'   `FALSE`, each element will be preceded by the number one; many markdown
#'   engines will automatically render repeated ones as a sequential list.
#' @param pad logical; If sequential numbers are used, should they be padded
#'   with zeroes on the left to match the width of the greatest number? Defaults
#'   to `TRUE`.
#' @param punct The puctuation mark following each number; either `.` or `)`.
#' @param cat logical; Should the list be concatenated and printed, with each
#'   bullet element separated by a new line? Defaults to `FALSE`.
#' @return A character vector with elements preceded by a number.
#' @examples
#' md_list(state.name)
#' md_list(state.name, cat = TRUE)
#' @importFrom stringr str_pad
#' @export
md_list <- function(x, seq = TRUE, pad = TRUE, punct = c(".", ")"), cat = FALSE) {
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
  markers <- paste0(nums, punct)
  list <- paste(markers, x)
  if (cat) {
    cat(list, sep = "\n")
  } else {
    return(list)
  }
}

#' @title Markdown Task List
#' @description
#' @details From the [GFM spec](https://github.github.com/gfm/#task-list-item): A task
#'   [list item](https://github.github.com/gfm/#list-items) is a list item where the first block in
#'   it is a paragraph which begins with a
#'   [task list item marker](https://github.github.com/gfm/#task-list-item-marker) and at least one
#'   whitespace character before any other content… A task list item marker consists of an optional
#'   number of spaces, a left bracket (`[`), either a whitespace character or the letter `x` in
#'   either lowercase or uppercase, and then a right bracket (`]`)… When rendered, the task list
#'   item marker is replaced with a semantic checkbox element… If the character between the
#'   brackets is a whitespace character, the checkbox is unchecked. Otherwise, the checkbox is
#'   checked.
#' @param x The vector of task list items.
#' @param check A vector of list elements which should be checked off.
#' @param cat logical; Should the list be concatenated and printed, with each
#'   bullet element separated by a new line? Defaults to `FALSE`.
#' @return A character vector check box brackets prepended to each element.
#' @examples
#' md_task(c("Wake up", "Eat Breakfast", "Brush Teeth"), check = 1:2)
#' @export
md_task <- function(x, check = NULL, cat = FALSE) {
  boxes <- rep("* [ ]", length(x))
  if (!is.null(check)) {
    boxes[check] <- "* [x]"
  }
  list <- paste(boxes, x)
  if (cat) {
    cat(list, sep = "\n")
  } else {
    return(list)
  }
}
