#' @title Markdown ATX Headings
#' @param x The text of the headers.
#' @param level The number of header hash characters. The heading level is equal
#'   to the number of # characters in the opening sequence. In rendered markdown
#'   higher levels are typically displayed larger.
#' @return A character vector with elements preceded by hash symbols.
#' @importFrom glue glue_collapse
#' @examples
#' md_header("Overview")
#' @export
md_header <- function(x, level = 1) {
  if (level > 6) {
    stop("More than 6 #'s is not a valid markdown heading.")
  }
  hashes <- glue::glue_collapse(rep("#", level))
  paste(hashes, x)
}

#' @title Markdown Bold Emphasis
#' @param x The text to be emphasized in bold.
#' @return A character vector with elements wrapped in two asterisk symbols.
#' @examples
#' md_bold("Example")
#' md_bold(state.name)
#' @importFrom glue glue
#' @export
md_bold <- function(x) {
  glue::glue("**{x}**")
}

#' @title Markdown Italic Emphasis
#' @param x The text to be emphasized in italics.
#' @return A character vector with elements wrapped in underscore symbols.
#' @examples
#' md_italic("Example")
#' md_italic(state.name)
#' @importFrom glue glue
#' @export
md_italic <- function(x) {
  glue::glue("_{x}_")
}

#' @title Markdown Inline Code
#' @param x The text to be formatted as inline code.
#' @return A character vector with elements wrapped in backtick symbols.
#' @examples
#' md_inline("ex_var")
#' md_inline(state.name)
#' @importFrom glue glue
#' @export
md_inline <- function(x) {
  glue::glue("`{x}`")
}

#' @title Markdown Strikethough Emphasis
#' @param x The text to be striked though.
#' @return A character vector with elements wrapped in two tilde symbols.
#' @examples
#' md_strike("Example")
#' md_strike(state.name)
#' @importFrom glue glue
#' @export
md_strike <- function(x) {
  glue::glue("~~{x}~~")
}

#' @title Markdown Bullet List
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
#' @param x The vector of numbered list items.
#' @param seq logical; Should sequential numbers be used? Defaults to `TRUE`. If
#'   `FALSE`, each element will be preceded by the number one; many markdown
#'   engines will automatically render repeated ones as a sequential list.
#' @param pad logical; If sequential numbers are used, should they be padded
#'   with zeroes on the left to match the width of the greatest number? Defaults
#'   to `TRUE`.
#' @param cat logical; Should the list be concatenated and printed, with each
#'   bullet element separated by a new line? Defaults to `FALSE`.
#' @return A character vector with elements preceded by a number.
#' @examples
#' md_list(state.name)
#' md_list(state.name, cat = TRUE)
#' @importFrom stringr str_pad
#' @export
md_list <- function(x, seq = TRUE, pad = TRUE, cat = FALSE) {
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
  list <- paste(nums, x, sep = ". ")
  if (cat) {
    cat(list, sep = "\n")
  } else {
    return(list)
  }
}

#' @title Markdown Task List
#' @param x The vector of task list items.
#' @param checks A vector of list elements which should be checked off.
#' @param cat logical; Should the list be concatenated and printed, with each
#'   bullet element separated by a new line? Defaults to `FALSE`.
#' @return A character vector with elements preceded check box brackets.
#' @examples
#' md_task(c("Wake up", "Eat Breakfast", "Brush Teeth"), checks = 1:2)
#' @export
md_task <- function(x, checks = NULL, cat = FALSE) {
  boxes <- rep("* [ ]", length(x))
  if (!is.null(checks)) {
    boxes[checks] <- "* [x]"
  }
  list <- paste(boxes, x)
  if (cat) {
    cat(list, sep = "\n")
  } else {
    return(list)
  }
}

#' @title Markdown Block Quotes
#' @param x The character vector of quotes.
#' @return A character vector with elements preceded by an greater-than symbol.
#' @examples
#' md_quote(gluedown:::preamble)
#' @export
md_quote <- function(x) {
  # todo: str_wrap?
  paste(">", x)
}

#' @title Markdown Horizontal Rule
#' @param char The character used. Either an asterisk, hyphen, or underscore.
#' @param n The number of times to repeat each character.
#' @return A character vector of a repeated horizontal rule character.
#' @examples
#' md_rule()
#' md_rule("_", n = 10)
#' @importFrom glue glue_collapse
#' @export
md_rule <- function(char = c("*", "-", "_"), n = 3) {
  if (n < 3) {
    stop("At least 3 characters must be used")
  }
  if (n > 80) {
    stop("Refrain from using more than 80 characters")
  }
  char <- match.arg(char)
  glue::glue_collapse(rep(char, n))
}

#' @title Markdown Hyperlink
#' @param text The chracter vector to be displayed as hyperlinked text.
#' @param url The URL to lead to.
#' @return A character vector of collapsed display text and associated URLs.
#' @examples
#' md_link("tidyverse", "https://www.tidyverse.org/")
#' md_link(c("R Project", "CRAN"), c("https://www.r-project.org/", "https://cran.r-project.org/"))
#' @export
md_link <- function(text, url) {
  glue::glue("[{text}]({url})")
}

#' @title Markdown Image
#' @param alt The optional
#'    [alternative text](https://en.wikipedia.org/wiki/Alt_attribute) that can
#'    be used to refer to an image.
#' @param url The URL of an image to be displayed or referenced.
#' @return A character vector of collapsed alternative text and associated URLs.
#' @examples
#' md_image("http://hexb.in/hexagons/eff.png")
#' md_image("http://hexb.in/hexagons/eff.png", "EFF Hex Sticker")
#' @export
md_image <- function(url, alt = "") {
  glue::glue("![{alt}]({url})")
}

#' @title Markdown Issue
#' @description A markdown feature unique to GitHub. Allows users to hyperlink
#' a specific issue or pull request using a username, repository name, and
#' issue number.
#' @param repo A character vector in the format `"user/rep"`.
#' @param num The issue or pull number _without_ hash symbol.
#' @return A character vector which GitHub can automatically hyperlink.
#' @examples
#' md_issue("kiernann/gluedown", 1)
#' @export
md_issue <- function(repo, num) {
  if (is.na(as.numeric(num))) {
    stop("The num must be coercible to numeric.")
  }
  if (!grepl("/", repo)) {
    warning("Your repo is not ideally formatted. A forward slash was not detected.")
  }
  paste(repo, num, sep = "#")
}

#' @title Markdown Code Fence
#' @param x Either (1) a path of _one_ existing file to be read as a character
#'   vector or (2) a character vector of lines to be wrapped in fences.
#' @param lang The language of the code within the fence. Aside from clarity,
#'   this allows many markdown engines to adjust the syntax highlighing.
#'   Defaults to "R".
#' @param cat logical; Should the list be concatenated and printed, with each
#'   bullet element separated by a new line? Defaults to `TRUE` for only
#'   [md_fence()].
#' @return A character vector wrapped on either side by code fences.
#' @examples
#' md_fence(gluedown:::plot)
#' @export
md_fence <- function(x, lang = "R", cat = TRUE) {
  # todo: use lists?
  if (length(x) == 1) {
    if (file.exists(x)) {
      x <- readLines(x)
    }
  }
  fence <- c(paste0("```", lang), x, "```")
  if (cat) {
    cat(fence, sep = "\n")
  } else {
    return(fence)
  }
}
