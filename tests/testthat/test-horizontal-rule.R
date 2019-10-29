library(testthat)
library(gluedown)
library(stringr)
library(knitr)
library(rvest)

test_that("md_break makes blocks convertable to HTML horizontal rule", {
  node <-
    # create rule
    md_rule() %>%
    # convert to HTML string
    md_convert() %>%
    # read as HTML file
    read_html() %>%
    # find horizontal rule node
    html_node(css = "hr")
  # expect list items to all be the same
  expect_false(object = is.na(node))
})

test_that("md_break stops with incorrect number of characters", {
  expect_error(md_rule(n = 2))
})
