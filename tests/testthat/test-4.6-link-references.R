library(testthat)
library(gluedown)
library(stringr)
library(glue)
library(rvest)

find_nodes <- function(md, node) {
  md %>%
    md_convert() %>%
    read_html() %>%
    html_nodes(node)
}

expect_empty <- function(object) {
  expect_true(length(object) == 0)
}

expect_full <- function(object) {
  expect_true(length(object) != 0)
}

test_that("md_reference creates a simple <href> tag (ex. 161)", {
  # https://github.github.com/gfm/#example-161
  ref <- md_reference("foo", "/url", "title")
  lines <- md_paragraph(c(ref, "[foo]"))
  node <- md_convert(lines) %>% find_nodes("a") %>% html_attr("href")
  expect_equal(node, "/url")
  node <- md_convert(lines) %>% find_nodes("a") %>% html_text()
  expect_equal(node, "foo")
})

test_that("md_reference may omit the title (ex. 166)", {
  # https://github.github.com/gfm/#example-166
  ref <- md_reference("foo", "\n/url")
  lines <- md_paragraph(c(ref, "[foo]"))
  node <- md_convert(lines) %>% find_nodes("a") %>% html_attr("href")
  expect_equal(node, "/url")
  node <- md_convert(lines) %>% find_nodes("a") %>% html_text()
  expect_equal(node, "foo")
})

test_that("md_reference may not omit a link destination (ex. 168)", {
  # https://github.github.com/gfm/#example-168
  expect_error(md_reference("foo"))
})

test_that("md_reference can use angled link destination (ex. 169)", {
  skip("Not rendered by md_convert(), still created")
  # https://github.github.com/gfm/#example-169
  ref <- md_reference("foo", "<>")
  lines <- md_paragraph(c(ref, "[foo]"))
  node <- md_convert(lines) %>% find_nodes("a") %>% html_attr("href")
  expect_equal(node, "/url")
})

md_paragraph(c(
  md_reference("FOO", "/url"),
  "[foo]\n"
)) %>% md_convert()
