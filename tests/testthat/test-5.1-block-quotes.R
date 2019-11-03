library(testthat)
library(gluedown)
library(stringr)
library(rvest)
library(glue)

expect_empty <- function(object) {
  expect_true(length(object) == 0)
}
expect_full <- function(object) {
  expect_true(length(object) != 0)
}
expect_nchar <- function(object, n) {
  expect_true(nchar(object) == n)
}

test_that("md_quote creates a <blockquote> tag with other blocks (ex. 206)", {
  # https://github.github.com/gfm/#example-206
  lines <- md_quote(md_softline(md_heading("Foo"), "bar", "baz"))
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_node("blockquote") %>%
    expect_full()
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_node("h1") %>%
    html_text() %>%
    expect_equal("Foo")
})

test_that("md_quote can create an empty block quote (ex. 217)", {
  # https://github.github.com/gfm/#example-217
  node <- md_quote("") %>%
    md_convert() %>%
    read_html() %>%
    html_nodes("blockquote") %>%
    html_text(trim = TRUE)
  expect_nchar(node, 0)
})

test_that("md_quotes with soft lines create a single quote (ex. 221)", {
  # https://github.github.com/gfm/#example-221
  text <- c("foo", "bar")
  text %>%
    md_quote() %>%
    md_convert() %>%
    read_html() %>%
    html_node("blockquote") %>%
    html_text(trim = TRUE) %>%
    expect_equal(expected = str_c(text, collapse = "\n"))
})

test_that("md_quotes with blank lines create paragraphs (ex. 222)", {
  # https://github.github.com/gfm/#example-222
  text <- c("foo", "", "bar")
  node <- text %>%
    md_quote() %>%
    md_convert() %>%
    read_html() %>%
    html_node("blockquote") %>%
    html_nodes("p") %>%
    html_text(trim = TRUE)
  expect_equal(node, text[which(text != "")])
})

test_that("md_quote can create nested block qutoes (ex. 228)", {
  # https://github.github.com/gfm/#example-228
  lines <- md_quote(md_quote(md_quote("foo")))
  nodes <- lines %>%
    md_convert() %>%
    read_html() %>%
    html_nodes("blockquote")
  expect_length(nodes, 3)
})
