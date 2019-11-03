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

test_that("md_bullet creates an <ul> tag with vector text (ex. 281)", {
  # https://github.github.com/gfm/#example-281
  text <- c("foo", "bar")
  lines <- md_bullet(text, marker = "-")
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_node("ul") %>%
    html_nodes("li") %>%
    html_text() %>%
    expect_equal(text)
})

test_that("md_order creates an <ol> tag with vector text (ex. 282)", {
  # https://github.github.com/gfm/#example-282
  text <- c("foo", "bar")
  lines <- md_order(text)
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_node("ol") %>%
    html_nodes("li") %>%
    html_text() %>%
    expect_equal(text)
})

test_that("md_order works without sequence", {
  text <- c("foo", "bar")
  lines <- md_order(text, seq = FALSE)
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_node("ol") %>%
    html_nodes("li") %>%
    html_text() %>%
    expect_equal(text)
})

test_that("md_order can pad when markers differ in length", {
  text <- rep(c("foo", "bar"), 5)
  lines <- md_order(text, pad = TRUE)
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_node("ol") %>%
    html_nodes("li") %>%
    html_text() %>%
    expect_equal(text)
})
