#' Convert markdown to HTML
#'
#' Take a character vector of valid markdown text and pass it to
#' [markdown::markdownToHTML()] to create a glue vector of HTML fragments.
#' Primarily used to test that `md_*()` functions create vectors that meet the
#' GFM spec and can be rendered as HTML.
#'
#' @details
#' GFM enables the `tagfilter` extension, where the following HTML tags will be
#' filtered when rendering HTML output...
#' @param x A character vector of _markdown_ text to be converted.
#' @param frag logical; Whether only a single HTML fragment should be returned.
#'   `TRUE` by default.
#' @param disallow logical; Should [md_disallow()] be called on the converted
#'   output?
#' @return A `glue` vector of length 1 containing HTML tags.
#' @family inline functions
#' @examples
#' md_convert(x = md_bold("test"))
#' @importFrom glue as_glue
#' @importFrom markdown markdownToHTML
#' @importFrom stringr str_detect
#' @export
md_convert <- function(x, frag = TRUE, disallow = TRUE) {
  html <- glue::as_glue(markdown::markdownToHTML(text = x, fragment.only = frag))
  bad <- c(
    "<title(.*)>",
    "<textarea(.*)>",
    "<style(.*)>",
    "<xmp(.*)>",
    "<iframe(.*)>",
    "<noembed(.*)>",
    "<noframes(.*)>",
    "<script(.*)>",
    "<plaintext(.*)>"
  )
  if (disallow) {
    md_disallow(html)
  } else {
    return(html)
  }
}

#' Disallow certain raw HTML
#'
#' Take a character vector of raw HTML text (possibly via [md_convert()]) and
#' disallow certain tags by replacing `<` with `&lt;`.
#'
#' @details
#' GFM enables the tagfilter extension, where the following HTML tags will be
#' filtered when rendering HTML output:
#' * `<title>`
#' * `<textarea>`
#' * `<style>`
#' * `<xmp>`
#' * `<iframe>`
#' * `<noembed>`
#' * `<noframes>`
#' * `<script>`
#' * `<plaintext>`
#'
#' Filtering is done by replacing the leading `<` with the entity `&lt;`. These
#' tags are chosen in particular as they change how HTML is interpreted in a way
#' unique to them (i.e. nested HTML is interpreted differently), and this is
#' usually undesireable (sic) in the context of other rendered Markdown content.
#'
#' All other HTML tags are left untouched.
#' @param html A character vector of _markdown_ text to be converted.
#' @return A `glue` vector of length 1 containing HTML tags.
#' @family inline functions
#' @examples
#' md_disallow("<title>GitHub Flavored Markdown Spec</title>")
#' @importFrom glue as_glue
#' @importFrom markdown markdownToHTML
#' @importFrom stringr str_detect
#' @export
md_disallow <- function(html) {
  bad <- c(
    # pattern...     replacement
    "<(title)"     = "&lt;\\1",
    "<(textarea)"  = "&lt;\\1",
    "<(style)"     = "&lt;\\1",
    "<(xmp)"       = "&lt;\\1",
    "<(iframe)"    = "&lt;\\1",
    "<(noembed)"   = "&lt;\\1",
    "<(noframes)"  = "&lt;\\1",
    "<(script)"    = "&lt;\\1",
    "<(plaintext)" = "&lt;\\1",
    # upper versions too
    "<(TITLE)"     = "&lt;\\1",
    "<(TEXTAREA)"  = "&lt;\\1",
    "<(STYLE)"     = "&lt;\\1",
    "<(XMP)"       = "&lt;\\1",
    "<(IFRAME)"    = "&lt;\\1",
    "<(NOEMBED)"   = "&lt;\\1",
    "<(NOFRAMES)"  = "&lt;\\1",
    "<(SCRIPT)"    = "&lt;\\1",
    "<(PLAINTEXT)" = "&lt;\\1"
  )
  glue::as_glue(
    stringr::str_replace_all(
      string = html,
      pattern = bad,
      replacement = "&lt;(\\1)"
    )
  )
}
