library(testthat)
library(gluedown)
library(stringr)
library(knitr)
library(rvest)

test_that("md_task makes blocks convertable to HTML unordered list", {
  # create vector
  chores <- c("Wake up", "Eat breakfast", "Brush teeth")
  # create list from vector
  list <- md_task(chores)
  node <-
    # convery vector to HTML string
    md_convert(list) %>%
    # read string as file
    read_html() %>%
    # find unordered list node
    html_node(css = "ul") %>%
    # find list item nodes
    html_nodes(css = "li") %>%
    # convert nodes to vector
    html_text(trim = TRUE) %>%
    str_remove("^\\[\\s\\]\\s")
  # expect list items to all be the same
  expect_true(object = all(node == chores))
})

test_that("md_task works with check boxes", {
  # create vector
  chores <- c("Wake up", "Eat breakfast", "Brush teeth")
  # create list from vector
  list <- md_task(chores, check = 1:2)
  node <-
    # convery vector to HTML string
    md_convert(list) %>%
    # read string as file
    read_html() %>%
    # find unordered list node
    html_node(css = "ul") %>%
    # find list item nodes
    html_nodes(css = "li") %>%
    # convert nodes to vector
    html_text(trim = TRUE) %>%
    str_extract("(?<=\\[)(.*?)(?=\\])")
  checks <- rep(c("x", " "), c(2, 1))
  # expect list items to all be the same
  expect_true(object = all(node == checks))
})
