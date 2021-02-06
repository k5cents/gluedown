#' Pipe operator
#'
#' See \code{magrittr::\link[magrittr:pipe]{\%>\%}} for details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL

is_installed <- function(pkg) {
  isTRUE(requireNamespace(pkg, quietly = TRUE))
}

#' Check if the user has the 'knitr' package installed
#' @export
has_knitr <- function() {
  is_installed(pkg = "knitr")
}

#' @rdname has_knitr
#' @export
has_markdown <- function() {
  is_installed(pkg = "markdown")
}

find_nodes <- function(md, node) {
  rvest::html_nodes(xml2::read_html(md_convert(md)), node)
}

expect_empty <- function(object) {
  testthat::expect_true(length(object) == 0)
}

expect_full <- function(object) {
  testthat::expect_true(length(object) != 0)
}

expect_nchar <- function(object, n) {
  testthat::expect_true(nchar(object) == n)
}

expect_missing <- function(object) {
  testthat::expect_true(is.na(object))
}
