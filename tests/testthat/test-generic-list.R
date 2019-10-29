library(testthat)
library(gluedown)
library(stringr)
library(rvest)

test_that("md_list can call md_bullet with custom marker", {
  # create vector
  vector <- state.name[1:5]
  # create list from vector
  list <- md_list(vector, type = "bullet", marker = "+")
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
    html_text(trim = TRUE)
  # expect list items to all be the same
  expect_true(object = all(node == vector))
})

test_that("md_list can call md_order with custom marker", {
  # create vector
  vector <- state.name[35:40]
  # create list from vector
  list <- md_list(vector, type = "ordered", marker = ")")
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

test_that("md_list can call md_task with custom checks", {
  # create vector
  chores <- c("Wake up", "Eat breakfast", "Brush teeth")
  # create list from vector
  list <- md_list(chores, type = "task", check = 1:2)
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


