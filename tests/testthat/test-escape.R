library(gluedown)
library(testthat)
library(rvest)

test_that("md_escape prevents md_convert from creating valid HTML nodes", {
  node <- md_escape("One *two* three") %>%
    md_convert() %>%
    read_html() %>%
    html_node("strong")
  expect_true(is.na(node))
})


