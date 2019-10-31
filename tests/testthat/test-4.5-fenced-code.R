library(testthat)
library(gluedown)
library(stringr)
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

expect_nchar <- function(object, n) {
  expect_true(nchar(object) == n)
}

test_that("md_fence creates a simple backtick code block (ex. 89)", {
  # https://github.github.com/gfm/#example-89
  lines <- md_fence(c("<", " >"), lang = NULL)
  node <- md_convert(lines) %>%
    find_nodes("pre") %>%
    html_node("code")
  expect_full(node)
})

test_that("md_fence creates a simple tilde code block (ex. 90)", {
  # https://github.github.com/gfm/#example-90
  lines <- md_fence(c("<", " >"), char = "`", lang = NULL)
  node <- md_convert(lines) %>%
    find_nodes("pre") %>%
    html_node("code")
  expect_full(node)
})

test_that("md_fence can have all empty lines as content (ex. 99)", {
  # https://github.github.com/gfm/#example-99
  node <- md_fence(c("\n", "  "), lang = NULL) %>%
    md_convert() %>%
    find_nodes("code") %>%
    html_text()
  expect_nchar(str_trim(node), 0)
})

test_that("md_fence can havbe no content (ex. 100)", {
  # https://github.github.com/gfm/#example-100
  node <- md_fence("", lang = NULL) %>%
    md_convert() %>%
    find_nodes("code")
  expect_full(node)
})
