library(testthat)
library(gluedown)
library(rvest)
library(glue)

test_that("md_italic creates a <em> tag (ex. 360)", {
  # https://github.github.com/gfm/#example-360
  text <- "foo bar"
  md_italic(text) %>%
    md_convert() %>%
    read_html() %>%
    html_node("em") %>%
    html_text() %>%
    expect_equal(text)
})

test_that("md_bold creates a <strong> tag (ex. 387)", {
  # https://github.github.com/gfm/#example-387
  text <- "foo bar"
  md_bold(text) %>%
    md_convert() %>%
    read_html() %>%
    html_node("strong") %>%
    html_text() %>%
    expect_equal(text)
})
