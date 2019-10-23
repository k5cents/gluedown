library(testthat)
library(gluedown)
library(rvest)

test_that("md_heading makes a level 1 heading convertable to HTML H1 tag", {
  heading <- "Level 1"
  node <-
    md_heading(heading, level = 1) %>%
    md_convert() %>%
    read_html() %>%
    html_node("h1") %>%
    html_text()
  expect_true(object = all(node == heading))
})

test_that("md_heading makes a level 2 heading convertable to HTML H1 tag", {
  heading <- "Level 2"
  node <-
    md_heading(heading, level = 2) %>%
    md_convert() %>%
    read_html() %>%
    html_node("h2") %>%
    html_text()
  expect_true(object = all(node == heading))
})

test_that("md_heading makes a level 6 heading convertable to HTML H6 tag", {
  heading <- "Level 6"
  node <-
    md_heading(heading, level = 6) %>%
    md_convert() %>%
    read_html() %>%
    html_node("h6") %>%
    html_text()
  expect_true(object = all(node == heading))
})
