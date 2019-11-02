library(testthat)
library(gluedown)
library(stringr)
library(tibble)
library(rvest)
library(glue)

find_nodes <- function(md, node) {
  md %>%
    md_convert() %>%
    read_html() %>%
    html_nodes(node)
}

expect_empty <- function(object) {
  expect_true(length(object) == 0)
}

expect_full <- function(object) {
  expect_true(length(object) != 0)
}

expect_nchar <- function(object, n) {
  expect_true(nchar(object) == n)
}

test_that("md_quote creates a <blockquote> tag with other blocks (ex. 206)", {
  # https://github.github.com/gfm/#example-206
  lines <- md_softline(md_heading("Foo"), "bar", "baz") %>% md_quote()
  node <- md_convert(lines) %>%
    find_nodes("blockquote")
  expect_full(node)
  node <- md_convert(lines) %>%
    find_nodes("h1") %>%
    html_text()
  expect_equal(node, "Foo")
})

test_that("md_quote can create an empty block quote (ex. 217)", {
  # https://github.github.com/gfm/#example-217
  node <- md_quote("") %>%
    find_nodes("blockquote") %>%
    html_text(trim = TRUE)
  expect_nchar(node, 0)
})

test_that("md_quotes with soft lines create a single quote (ex. 221)", {
  # https://github.github.com/gfm/#example-221
  text <- c("foo", "bar")
  node <- md_quote(text) %>%
    md_softline() %>%
    md_convert() %>%
    find_nodes("blockquote") %>%
    html_text(trim = TRUE)
  expect_equal(node, str_c(text, collapse = "\n"))
})
