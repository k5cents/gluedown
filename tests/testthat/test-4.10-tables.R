library(testthat)
library(gluedown)
library(stringr)
library(rvest)
library(glue)

test_that("md_table creates a single <table> tag (ex. 198)", {
  # https://github.github.com/gfm/#example-198
  df <- data.frame(
    foo = "baz",
    bar = "bim",
    stringsAsFactors = FALSE
  )
  node <- md_table(df) %>%
    md_convert() %>%
    read_html() %>%
    html_node("table") %>%
    html_table() %>%
    as.data.frame()
  expect_equal(node, df)
})

test_that("md_table can create a table with no body (ex. 205)", {
  # https://github.github.com/gfm/#example-205
  df <- data.frame(
    foo = logical(),
    bar = logical(),
    stringsAsFactors = FALSE
  )
  node <- md_table(df) %>%
    md_convert() %>%
    read_html() %>%
    html_node("table") %>%
    html_table() %>%
    as.data.frame()
  expect_equal(node, df)
})
