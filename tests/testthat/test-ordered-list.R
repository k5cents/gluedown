library(testthat)
library(gluedown)
library(stringr)
library(knitr)
library(rvest)

test_that("md_list makes blocks convertable to HTML ordered list", {
  # create vector
  vector <- state.name[1:5]
  # create list from vector
  list <- md_list(vector, cat = FALSE)
  node <-
    # convery vector to HTML string
    md_convert(list) %>%
    # read string as file
    read_html() %>%
    # find unordered list node
    html_node(css = "ol") %>%
    # find list item nodes
    html_nodes(css = "li") %>%
    # convert nodes to vector
    html_text(trim = TRUE)
  # expect list items to all be the same
  expect_true(object = all(node == vector))
})
