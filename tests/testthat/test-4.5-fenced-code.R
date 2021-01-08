library(testthat)
library(gluedown)
library(stringr)
library(glue)
library(rvest)

test_that("md_fence creates a simple backtick code block (ex. 89)", {
  # https://github.github.com/gfm/#example-89
  lines <- md_fence(c("<", " >"), info = NULL)
  node <- md_convert(lines) %>%
    find_nodes("pre") %>%
    html_node("code")
  expect_full(node)
})

test_that("md_fence creates a simple tilde code block (ex. 90)", {
  # https://github.github.com/gfm/#example-90
  lines <- md_fence(c("<", " >"), char = "`", info = NULL)
  node <- md_convert(lines) %>%
    find_nodes("pre") %>%
    html_node("code")
  expect_full(node)
})

test_that("md_fence can have all empty lines as content (ex. 99)", {
  # https://github.github.com/gfm/#example-99
  node <- md_fence(c("\n", "  "), info = NULL) %>%
    md_convert() %>%
    find_nodes("code") %>%
    html_text()
  expect_nchar(str_trim(node), 0)
})

test_that("md_fence can havbe no content (ex. 100)", {
  # https://github.github.com/gfm/#example-100
  node <- md_fence("", info = NULL) %>%
    md_convert() %>%
    find_nodes("code")
  expect_full(node)
})

test_that("md_fence blocks can interrupt paragraphs (ex. 110)", {
  # https://github.github.com/gfm/#example-110
  lines <- md_softline(
    "foo",
    md_fence("bar", info = NULL),
    "baz"
  )
  node <- md_convert(lines) %>%
    find_nodes("code") %>%
    html_text(trim = TRUE)
  expect_equal(node, "bar")
})

test_that("md_fence works when surrounded by blocks and no newline (ex. 111)", {
  # https://github.github.com/gfm/#example-111
  lines <- md_softline(
    md_setext("foo", 2),
    md_fence("bar", char = "~", info = NULL),
    md_heading("baz", 1)
  )
  node <- md_convert(lines) %>%
    find_nodes("h2") %>%
    html_text(trim = TRUE)
  expect_equal(node, "foo")
  node <- md_convert(lines) %>%
    find_nodes("code") %>%
    html_text(trim = TRUE)
  expect_equal(node, "bar")
  node <- md_convert(lines) %>%
    find_nodes("h1") %>%
    html_text(trim = TRUE)
  expect_equal(node, "baz")
})

test_that("md_fence uses an info string that creates a class tag (ex. 112)", {
  # https://github.github.com/gfm/#example-112
  lines <- c("def foo(x)","  return 3", "end") %>%
    md_fence(char = "`", info = "ruby")
  node <- md_convert(lines) %>%
    find_nodes("code") %>%
    html_attr("class")
  expect_equal(node, "ruby")
})

test_that("md_fence info string can ignore extra (ex. 113)", {
  skip("This render is not supported by markdown::markdownToHTML()")
  # https://github.github.com/gfm/#example-113
  lines <- c("def foo(x)","  return 3", "end") %>%
    md_fence(char = "`", info = "    ruby startline=3 $%@#$")
  node <- md_convert(lines) %>%
    find_nodes("code") %>%
    html_attr("class")
  expect_equal(node, "ruby")
})

test_that("md_fence backtick info string can't contain backticks (ex. 115)", {
  # https://github.github.com/gfm/#example-115
  expect_error(md_fence("foo", info = "aa ```"))
})

test_that("md_fence tilde info string can contain backticks (ex. 116)", {
  # https://github.github.com/gfm/#example-116
  # this doesn't actual work due to md_convert issue with info strings
  # not a violation of gfm spec, just a conversion issue
  node <- md_fence("foo", char = "~", info = "aa ```") %>%
    md_convert() %>%
    find_nodes("code")
  expect_full(node)
})

test_that("md_chunk can call each chunk type", {
  x <- deparse(md_bold)
  node <- md_chunk(x, "tick") %>% md_convert() %>% find_nodes("code")
  expect_full(node)
  node <- md_chunk(x, "tilde") %>% md_convert() %>% find_nodes("code")
  expect_full(node)
  node <- md_chunk(x, "indent") %>% md_convert() %>% find_nodes("code")
  expect_full(node)
})
