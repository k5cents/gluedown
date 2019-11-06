library(testthat)
library(gluedown)
library(rvest)
library(glue)

test_that("md_strike creates a <del> tag (ex. 491)", {
  # https://github.github.com/gfm/#example-491
  text <- "Hi Hello, world!"
  target <- map_md(text, md_strike, 1)
  target %>%
    md_convert() %>%
    read_html() %>%
    html_node("del") %>%
    html_text() %>%
    expect_equal("Hi")
  target %>%
    md_convert() %>%
    read_html() %>%
    html_node("p") %>%
    html_text() %>%
    expect_equal(text)
})
