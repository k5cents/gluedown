library(testthat)
library(gluedown)
library(rvest)
library(glue)

test_that("md_text creates a vector of glue class", {
  md_text("foo") %>% expect_s3_class("glue")
})

test_that("md_text creates plain textual content (ex. 671)", {
  # https://github.github.com/gfm/#example-671
  text <- "hello $.;'there"
  md_text(text) %>%
    md_convert() %>%
    read_html() %>%
    html_node("p") %>%
    html_text() %>%
    expect_equal(text)
})
