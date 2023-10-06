#' @title gluedown: A package to format character vectors with markdown.
#'
#' @description The `gluedown` package helps transition from R's powerful
#'   vectors to formatted markdown text. The functions use [glue::glue()] to
#'   wrap character vectors in valid markdown syntax. In combination with the
#'   `knitr` package, this allows users to directly print R vectors as formatted
#'   text for improved clarity and readability.
#'
#' @section Glue wrappers:
#' The `md_*()` functions return `glue` objects, which are returned using
#' [cat()] by default. This allows users to both manipulate the formatted
#' strings as they would with any character vector and still present the
#' string to the user when an `knitr` chunk option is set to return code
#' results `'asis'`.
#'
#' @section Other wrappers:
#' The [md_table()] and [md_convert()] functions wrap around [knitr::kable()]
#' and [markdown::markdownToHTML()] respectively. The later allows users to
#' convert `md_*()` outputs to HTML fragments.
#'
#' @keywords internal
"_PACKAGE"

## usethis namespace: start
## usethis namespace: end
NULL
