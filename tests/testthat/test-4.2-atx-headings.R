library(testthat)
library(gluedown)
library(glue)
library(rvest)

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

test_that("md_heading creates tags <h2> through <h6> (ex. 32)", {
  # https://github.github.com/gfm/#example-32
  lines <- md_heading("foo", 1:6)
  for (i in seq_along(lines)) {
    node <- md_convert(lines) %>%
      find_nodes(paste0("h", i)) %>%
      html_text(trim = TRUE)
    expect_equal(node, "foo")
  }
})

test_that("md_heading doesn't allow more than 6 #'s (ex.33)", {
  # https://github.github.com/gfm/#example-33
  expect_error(md_heading("foo", 7))
})

test_that("md_heading doesn't need to be separated from content (ex. 47)", {
  # https://github.github.com/gfm/#example-47
  lines <- md_softline(
    md_rule(n = 4),
    md_heading("foo", 2),
    md_rule(n = 4)
  )
  node <- md_convert(lines) %>%
    find_nodes("h2") %>%
    html_text(trim = TRUE)
  expect_equal(node, "foo")
})
