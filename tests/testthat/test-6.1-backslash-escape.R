library(testthat)
library(gluedown)
library(stringr)
library(rvest)
library(glue)

expect_empty <- function(object) {
  expect_true(length(object) == 0)
}
expect_full <- function(object) {
  expect_true(length(object) != 0)
}

test_that("md_escape prepends ASCII punctuation with a backslash (ex. 308)", {
  # https://github.github.com/gfm/#example-308
  ascii_punct <- as_glue("!\"#$%&'()*+,-./:;<=>?@[]^_`{|}~")
  n <- nchar(ascii_punct)
  md_escape(ascii_punct) %>%
    str_count("\\\\") %>%
    expect_equal(n)
})

test_that("md_escape prevents italic emphasis (ex. 311)", {
  # https://github.github.com/gfm/#example-311
  node <- md_italic("emphasis") %>%
    md_escape() %>%
    md_convert() %>%
    read_html() %>%
    html_node("em")
  expect_true(is.na(node))
})
