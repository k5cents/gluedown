library(testthat)
library(gluedown)
library(stringr)
library(rvest)
library(glue)

test_that("md_code creates a <code> tag (ex. 338)", {
  # https://github.github.com/gfm/#example-338
  md_code("foo") %>%
    md_convert() %>%
    read_html() %>%
    html_node("code") %>%
    html_text() %>%
    expect_equal("foo")
})

test_that("md_code double backticks if code contains backtick (ex. 339)", {
  # https://github.github.com/gfm/#example-339
  md_code("foo ` bar") %>%
    md_convert() %>%
    read_html() %>%
    html_node("code") %>%
    html_text() %>%
    expect_equal("foo ` bar")
})
