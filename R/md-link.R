#' @title Markdown Link Reference
#' @description Form the definition needed to reference a link destination
#'   elsewhere in a body of text.
#' @details From the [GFM spec](https://github.github.com/gfm/#link-reference-definition):
#'   A link reference definition consists of a
#'   [link label](https://github.github.com/gfm/#link-label), indented up to
#'   three spaces, followed by a colon (`:`), optional
#'   [whitespace](https://github.github.com/gfm/#whitespace) (including up to
#'   one [line ending](https://github.github.com/gfm/#line-ending)), a
#'   [link destination](https://github.github.com/gfm/#link-destination),
#'   optional whitespace (including up to one line ending), and an optional
#'   [link title](https://github.github.com/gfm/#link-title), which if it is
#'   present must be separated from the link destination by whitespace. No
#'   further
#'   [non-whitespace characters](https://github.github.com/gfm/#non-whitespace-character)
#'   may occur on the line.
#' @param label The character vector to be displayed as hyperlinked text.
#' @param url The URL to lead to.
#' @param title The title of the link.
#' @return A character vector of collapsed display text and associated URLs.
#' @family leaf block functions
#' @examples
#' md_reference("tv", "https://www.tidyverse.org/")
#' md_reference("tv", "https://www.tidyverse.org/", "tidyverse")
#' @export
md_reference <- function(label, url, title = NULL) {
  if (!is.null(title)) {
    glue::glue("[{label}]: {url} \"{title}\"")
  } else {
    glue::glue("[{label}]: {url}")
  }
}

#' @title Markdown Inline Like
#' @description Form an inline hyperlink to an another website.
#' @details From the [GFM spec](https://github.github.com/gfm/#inline-link):
#'   An inline link consists of a [link text](https://github.github.com/gfm/#link-text)
#'   followed immediately by a left parenthesis `(`... an optional link
#'   destination, an optional link title separated from the link destination by
#'   whitespace, optional whitespace, and a right parenthesis `)`.
#' @param text The character vector to be displayed as hyperlinked text.
#' @param url The URL to lead to.
#' @param title The title of the link.
#' @return A character vector of collapsed display text and associated URLs.
#' @family inline functions
#' @examples
#' md_link("tidyverse", "https://www.tidyverse.org/")
#' md_link(c("R Project", "CRAN"), c("https://www.r-project.org/", "https://cran.r-project.org/"))
#' @export
md_link <- function(text, url, title = NULL) {
  if (!is.null(title)) {
    glue::glue("[{text}]({url}) \"{title}\"")
  } else {
    glue::glue("[{text}]({url})")
  }
}

#' @title Markdown Image
#' @param alt The optional
#'    [alternative text](https://en.wikipedia.org/wiki/Alt_attribute) that can
#'    be used to refer to an image.
#' @param url The URL of an image to be displayed or referenced.
#' @return A character vector of collapsed alternative text and associated URLs.
#' @family inline functions
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
#' @family inline functions
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
  glue::glue("{repo}#{num}")
}
