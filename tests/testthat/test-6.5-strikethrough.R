library(testthat)
library(gluedown)
library(rvest)
library(glue)

test_that("md_strike creates a <del> tag (ex. 491)", {
  # https://github.github.com/gfm/#example-491
  text <- paste(md_strike("Hi"), "Hello", "world")
  text %>%
    md_convert() %>%
    read_html() %>%
    html_node("del") %>%
    html_text() %>%
    expect_equal("Hi")
  text %>%
    md_convert() %>%
    read_html() %>%
    html_node("p") %>%
    html_text() %>%
    expect_equal(gsub("~", "", text))
})
