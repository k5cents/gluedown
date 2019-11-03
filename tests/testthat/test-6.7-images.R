library(testthat)
library(gluedown)
library(stringr)
library(rvest)
library(glue)

expect_missing <- function(object) {
  expect_true(is.na(object))
}

test_that("md_image creates a <img> tag (ex. 580)", {
  # https://github.github.com/gfm/#example-580
  lines <- md_image("/url", "foo", "title")
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_node("img") %>%
    html_attr("src") %>%
    expect_equal("/url")
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_node("img") %>%
    html_attr("alt") %>%
    expect_equal("foo")
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_node("img") %>%
    html_attr("title") %>%
    expect_equal("title")
})

test_that("md_image creates a <img> tag without title (ex. 580)", {
  # https://github.github.com/gfm/#example-580
  lines <- md_image("/url", "foo")
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_node("img") %>%
    html_attr("src") %>%
    expect_equal("/url")
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_node("img") %>%
    html_attr("alt") %>%
    expect_equal("foo")
})
