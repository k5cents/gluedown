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

test_that("md_escape prevents italic emphasis (ex. 311)", {
  # https://github.github.com/gfm/#example-311
  node <- md_italic("emphasis") %>%
    md_escape() %>%
    md_convert() %>%
    read_html() %>%
    html_node("em")
  expect_true(is.na(node))
})



