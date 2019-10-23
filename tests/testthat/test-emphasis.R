library(testthat)
library(gluedown)
library(rvest)

test_that("md_bold makes inlines convertable to HTML bold text", {
  test_bold <- sample(state.name, 1)
  # read HTML
  node <-
    md_bold(test_bold) %>%
    md_convert() %>%
    read_html() %>%
    # find unordered list node
    html_node(css = "strong") %>%
    # convert nodes to vector
    html_text(trim = TRUE)
  # expect list items to all be the same
  expect_true(object = all(node == test_bold))
})

test_that("md_italic makes inlines convertable to HTML italic text", {
  test_bold <- sample(state.name, 1)
  # read HTML
  node <-
    md_italic(test_bold) %>%
    md_convert() %>%
    read_html() %>%
    # find unordered list node
    html_node(css = "em") %>%
    # convert nodes to vector
    html_text(trim = TRUE)
  # expect list items to all be the same
  expect_true(object = all(node == test_bold))
})

test_that("md_strike makes inlines convertable to HTML strikethrough text", {
  test_bold <- sample(state.name, 1)
  # read HTML
  node <-
    md_strike(test_bold) %>%
    md_convert() %>%
    read_html() %>%
    # find unordered list node
    html_node(css = "del") %>%
    # convert nodes to vector
    html_text(trim = TRUE)
  # expect list items to all be the same
  expect_true(object = all(node == test_bold))
})

test_that("md_code makes inlines convertable to HTML inline code text", {
  test_bold <- sample(state.name, 1)
  # read HTML
  node <-
    md_code(test_bold) %>%
    md_convert() %>%
    read_html() %>%
    # find unordered list node
    html_node(css = "code") %>%
    # convert nodes to vector
    html_text(trim = TRUE)
  # expect list items to all be the same
  expect_true(object = all(node == test_bold))
})
