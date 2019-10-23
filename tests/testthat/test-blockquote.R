library(testthat)
library(gluedown)
library(stringr)
library(knitr)
library(rvest)

test_that("md_quote makes blocks convertable to HTML blockquotes", {
  quote <- "This is a block quote!"
  node <- quote %>%
    md_quote(cat = FALSE) %>%
    md_convert() %>%
    read_html(encoding = "UTF-8") %>%
    html_node(css = "blockquote") %>%
    html_text(trim = TRUE)
  # expect list items to all be the same
  expect_true(object = all(node == quote))
})
