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

expect_nchar <- function(object, n) {
  expect_true(nchar(object) == n)
}

test_that("md_blank creates lines that are ignored (ex. 197)", {
  # https://github.github.com/gfm/#example-197
  lines <- md_softline(
    "  ",
    md_blank(),
    "aaa",
    "  ",
    md_blank(),
    md_heading("aaa"),
    md_blank(),
    "  "
  )
  md_convert(lines) %>%
    read_html() %>%
    html_node("p") %>%
    html_text() %>%
    expect_equal("aaa")
  md_convert(lines) %>%
    read_html() %>%
    html_node("h1") %>%
    html_text() %>%
    expect_equal("aaa")
})
