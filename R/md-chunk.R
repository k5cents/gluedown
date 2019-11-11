#' Markdown code block
#'
#' Take a character vector of lines and return a glue vector
#'
#' Turn a character vector of lines into a single code block either indented or
#' fenced in tildes or backticks. This markdown leaf block can be rendered as
#' nested HTML `<code>` and `<pre>` tags. This function either calls
#' [md_fence()] or [md_indent()] based on the `type` argument.
#'
#' @param x A character vector of lines to be wrapped concatenated into a single
#'   block, possibly created by [readLines()] or [deparse()].
#' @param ... Arguments to be passed to [md_fence()] or [md_indent()].
#' @param type The type of code block to be created. Either "tick", "tilde"
#'   (which call [md_fence()]) or "indent" (which calls [md_indent()]).
#' @return A `glue` object of length 1, with elements of `x` formatted via
#'   [md_fence()] or [md_indent()].
#' @family leaf block functions
#' @examples
#' md_chunk("$ sudo apt install r-base-dev", info = "bash")
#' md_chunk(c("library(ggplot2)", "ggplot(mpg)+", "geom_point(aes(displ, hwy))"), type = "tilde")
#' md_indent(
#'   n = c(4, 4, 6),
#'   x = c(
#'     "library(dplyr)",
#'     "starwars %>%",
#'     "filter(species == 'Droid')"
#'   )
#' )
#' @export
md_chunk <- function(x, type = c("tick", "tilde", "indent"), ...) {
  type <- match.arg(type)
  if (type == "tick") {
    md_fence(x, char = "`", ...)
  } else {
    if (type == "tilde") {
      md_fence(x, char = "~", ...)
    } else {
      md_indent(x, ...)
    }
  }
}

#' Markdown indented code block
#'
#' Turn a character vector of lines into a single code block with each line
#' indented four spaces. This markdown leaf block can be rendered as nested HTML
#' `<code>` and `<pre>` tags. This is the code block format required by legacy
#' Reddit-flavored Markdown.
#'
#' @details
#' An indented code block is composed of one or more indented chunks separated
#' by blank lines. An indented chunk is a sequence of non-blank lines, each
#' indented four or more spaces. The contents of the code block are the literal
#' contents of the lines, including trailing line endings, minus four spaces of
#' indentation. An indented code block has no info string.
#' @param x A character vector of lines to be wrapped concatenated into a
#'   single block, possibly created by [readLines()] or [deparse()].
#' @param n A numeric vector
#' @return A `glue` object of length 1, with the elements of `x` preceded with
#'   4 spaces and separated by a newline.
#' @family leaf block functions
#' @examples
#' md_indent(deparse(md_bold))
#' @importFrom glue glue glue_collapse
#' @importFrom stringr str_dup
#' @export
md_indent <- function(x, n = 4) {
  if (min(n) < 4) {
    stop("Indented code blocks must be indented by at least four spaces.")
  }
  glue::glue("{stringr::str_dup(' ', n)}{x}")
}

#' Markdown fenced code block
#'
#' Turn a character vector of lines into a single code block with lines
#' bookended with a code fence of backticks or tildes. This markdown leaf block
#' can be rendered as HTML `<code>` tags inside `<pre>` tags.
#'
#' @details
#' A code fence is a sequence of at least three consecutive backtick characters
#' ... or tildes (`~`). (Tildes and backticks cannot be mixed.) A fenced code
#' block begins with a code fence, indented no more than three spaces.
#'
#' The line with the opening code fence may optionally contain some text
#' following the code fence; this is trimmed of leading and trailing whitespace
#' and called the info string...
#'
#' The content of the code block consists of all subsequent lines, until a
#' closing code fence of the same type as the code block began with (backticks
#' or tildes), and with at least as many backticks or tildes as the opening code
#' fence...
#'
#' A fenced code block may interrupt a paragraph, and does not require a blank
#' line either before or after.
#'
#' The content of a code fence is treated as literal text, not parsed as
#' inlines. The first word of the info string is typically used to specify the
#' language of the code sample, and rendered in the class attribute of the code
#' tag. However, this spec does not mandate any particular treatment of the info
#' string (see the `info` argument).
#' @param x A character vector of lines to be wrapped concatenated into a single
#'   block, possibly created by possibly created by [readLines()] or
#'   [deparse()].
#' @param char The character to use in the code fence; either backtick
#'   characters... or tildes (`~`). Defaults to backticks.
#' @param info The info string text to follow the initial code fence, typically
#'   a code for the language of the lines of `x`. Defaults to `r`.
#' @return A character vector wrapped on either side by code fences.
#' @family leaf block functions
#' @examples
#' md_fence(deparse(sd))
#' md_fence(c("library(dplyr)", "starwars %>%", "  filter(species == 'Droid')"))
#' @importFrom glue glue glue_collapse
#' @importFrom stringr str_dup
#' @export
md_fence <- function(x, char = c("`", "~"), info = "r") {
  char <- match.arg(char)
  if (!is.null(info)) {
    if (char == "`" & grepl("`", info)) {
      stop("The info string cannot contain any backtick characters.")
    }
  }
  string <- glue_collapse(x, sep = "\n")
  fence <- stringr::str_dup(char, 3)
  info <- if (is.null(info)) {
    ""
  } else {
    info
  }
  glue::glue("{fence}{info}\n{string}\n{fence}")
}
