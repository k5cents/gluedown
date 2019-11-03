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

test_that("md_heading makes a level 2 heading convertable to HTML H2 tag", {
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

test_that("md_heading errors out at levels greater than H6", {
  expect_error(object = md_heading("Level 10", level = 10))
})

test_that("md_setext makes a level 1 heading convertable to HTML H1 tag", {
  heading <- "Level 1"
  node <-
    md_setext(heading, level = 1) %>%
    md_convert() %>%
    read_html() %>%
    html_node("h1") %>%
    html_text()
  expect_true(object = all(node == heading))
})

test_that("md_setext can make headings with custom underline width", {
  heading <- "Level 1"
  node <-
    md_setext(heading, level = 1, width = 50) %>%
    md_convert() %>%
    read_html() %>%
    html_node("h1") %>%
    html_text()
  expect_true(object = all(node == heading))
})

test_that("md_setext makes a level 2 heading convertable to HTML H2 tag", {
  heading <- "Level 2"
  node <-
    md_setext(heading, level = 2) %>%
    md_convert() %>%
    read_html() %>%
    html_node("h2") %>%
    html_text()
  expect_true(object = all(node == heading))
})

test_that("md_setext warns at levels greater than H2", {
  expect_error(object = md_setext("Level 10", level = 10))
})

test_that("md_setext stops if the heading is empty", {
  expect_error(object = md_setext(""))
})

test_that("md_setext creates a vector with length equal to x and level", {
  headings <- c("One", "Two")
  setext <- md_setext(x = headings, level = 1:2)
  h1 <- md_convert(setext) %>%
    read_html() %>%
    html_node("h1") %>%
    html_text(trim = TRUE)
  h2 <- md_convert(setext) %>%
    read_html() %>%
    html_node("h2") %>%
    html_text(trim = TRUE)
  expect_equal(headings[1], h1)
  expect_equal(headings[2], h2)
  expect_length(c(h1, h2), 2)
})
