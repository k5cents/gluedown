library(testthat)
library(gluedown)
library(stringr)
library(glue)
library(rvest)

test_that("md_indent creates a simple code block (ex. 77)", {
  # https://github.github.com/gfm/#example-77
  lines <- md_indent(c("a simple", "  indented code block"))
  node <- md_convert(lines) %>%
    find_nodes("pre") %>%
    html_node("code") %>%
    html_text() %>%
    str_trim() %>%
    str_squish()
  check <- str_trim(str_squish(str_c(lines, collapse = " ")))
  expect_equal(node, check)
})

test_that("md_inline creates lines without other formatting (ex. 80)", {
  # https://github.github.com/gfm/#example-80
  lines <- md_indent(c(
    "<a/>",
    md_bold("hi"),
    "\n",
    md_bullet("one", "-")
  ))
  node <- md_convert(lines) %>% find_nodes("al")
  expect_empty(node)
  node <- md_convert(lines) %>% find_nodes("strong")
  expect_empty(node)
  node <- md_convert(lines) %>% find_nodes("ul")
  expect_empty(node)
})

expect_that("md_indent doesn't interupt a paragraph (ex. 83)", {
  skip("could not find function 'condition'")
  # https://github.github.com/gfm/#example-83
  node <- c("Foo", md_indent("bar")) %>%
    md_softline() %>%
    md_convert() %>%
    read_html() %>%
    html_node("code")
  expect_true(is.na(node))
})

expect_that("md_indent ends after non-blank line (ex. 84)", {
  # https://github.github.com/gfm/#example-84
  node <- c(md_indent("Foo"), "bar") %>%
    md_softline() %>%
    md_convert() %>%
    find_nodes("code") %>%
    html_text(trim = TRUE)
  expect_equal(node, "Foo")
})

test_that("md_indent can occur immediately before other blocks (ex. 85)", {
  # https://github.github.com/gfm/#example-85
  lines <- md_softline(
    md_heading("Heading"),
    md_indent("foo"),
    md_setext("Heading", 2, 6),
    md_indent("foo"),
    md_rule("-", 4)
  )
  node <- md_convert(lines) %>%
    find_nodes("code") %>%
    html_text(trim = TRUE)
  expect_length(node, 2)
  expect_equal(unique(node), "foo")
})

test_that("md_indent ignores blank lines before and after (ex. 87)", {
  # https://github.github.com/gfm/#example-87
  node <- md_indent(c("", "foo", "")) %>%
    md_convert() %>%
    find_nodes("code") %>%
    html_text(trim = TRUE)
  expect_equal(nchar(node), 3)
})

test_that("md_indent preserves trailing spaces in block (ex. 88)", {
  # https://github.github.com/gfm/#example-88
  node <- md_indent("foo  ") %>%
    md_convert() %>%
    find_nodes("code") %>%
    html_text() %>%
    str_remove("\n")
  expect_true(str_detect(node, "\\s\\s"))
})

test_that("md_indent errors with less than four spaces", {
  expect_error(md_indent("foo", n = 3))
})
