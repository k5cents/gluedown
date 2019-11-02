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

test_that("md_table creates a single <table> tag (ex. 198)", {
  # https://github.github.com/gfm/#example-198
  df <- tribble(
    ~foo, ~bar,
    "baz", "bim"
  )
  node <- md_table(df) %>%
    find_nodes("table") %>%
    html_table() %>%
    `[[`(1) %>%
    as_tibble()
  expect_equal(node, df)
})

test_that("md_table can create a table with no body (ex. 205)", {
  # https://github.github.com/gfm/#example-205
  df <- tribble(
    ~foo, ~bar
  )
  node <- md_table(df) %>%
    find_nodes("table") %>%
    html_table() %>%
    `[[`(1) %>%
    as_tibble()
  expect_equal(node, df)
})
