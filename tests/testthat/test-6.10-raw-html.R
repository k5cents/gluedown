library(testthat)
library(gluedown)
library(rvest)
library(glue)

test_that("md_convert can optionally disallow certain HTML", {
  "foo" %>%
    md_bold() %>%
    md_convert(disallow = FALSE) %>%
    read_html() %>%
    html_node("strong") %>%
    html_text() %>%
    expect_equal("foo")
})
