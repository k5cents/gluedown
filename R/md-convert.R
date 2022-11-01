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
#' @export
md_convert <- function(x, frag = TRUE, disallow = TRUE) {
  if (!has_markdown()) {
    stop("Package 'markdown' needed for this function to work.")
  } else {
    html <- markdown::mark_html(text = x, options = c(
      if (frag) "-standalone", "-smart", "-tasklist"
    ))
    if (disallow) {
      md_disallow(html)
    } else {
      glue::as_glue(html)
    }
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
#' @export
md_disallow <- function(html) {
  bad <- c(
    "<(title)",
    "<(textarea)",
    "<(style)",
    "<(xmp)",
    "<(iframe)",
    "<(noembed)",
    "<(noframes)",
    "<(script)",
    "<(plaintext)"
  )
  for (i in seq_along(bad)) {
    html <- gsub(
      pattern = bad[[i]],
      replacement = "&lt;\\1",
      x = html,
      ignore.case = TRUE
    )
  }
  glue::as_glue(html)
}
