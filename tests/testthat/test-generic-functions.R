library(testthat)
library(gluedown)
library(stringr)
library(rvest)
library(glue)

test_that("md_list can create all list types", {
  x <- c("foo", "bar", "baz")
  x %>%
    md_list(type = "bullet") %>%
    md_convert() %>%
    read_html() %>%
    html_node("ul") %>%
    html_nodes("li") %>%
    html_text() %>%
    expect_equal(x)
  x %>%
    md_list(type = "task") %>%
    md_convert() %>%
    read_html() %>%
    html_node("ul") %>%
    html_nodes("li") %>%
    html_text() %>%
    str_remove("\\[(.*)\\]\\s") %>%
    expect_equal(x)
  x %>%
    md_list(type = "order") %>%
    md_convert() %>%
    read_html() %>%
    html_node("ol") %>%
    html_nodes("li") %>%
    html_text() %>%
    expect_equal(x)
})

test_that("md_chunk can create all list types", {
  x <- deparse(md_bold)
  y <- str_c(x, collapse = "\n")
  x %>%
    md_chunk(type = "indent") %>%
    md_convert() %>%
    read_html() %>%
    html_node("pre") %>%
    html_nodes("code") %>%
    html_text(trim = TRUE) %>%
    expect_equal(y)
  x %>%
    md_chunk(type = "tick") %>%
    md_convert() %>%
    read_html() %>%
    html_node("pre") %>%
    html_nodes("code") %>%
    html_text(trim = TRUE) %>%
    expect_equal(y)
  x %>%
    md_chunk(type = "tilde") %>%
    md_convert() %>%
    read_html() %>%
    html_node("pre") %>%
    html_nodes("code") %>%
    html_text(trim = TRUE) %>%
    expect_equal(y)
})

test_that("md_chunk errors in the same was as underlying function", {
  x <- deparse(md_bold)
  expect_error(md_chunk(x, type = "indent", n = 3))
})

test_that("md_convert fails without markdown", {
  mockr::with_mock(
    .env = as.environment("package:gluedown"),
    `has_markdown` = function() FALSE,
    expect_error(md_convert("**bold**"))
  )
})

test_that("md_convert works without dissalowing HTML", {
  html <- md_convert("<title>Title</title>", disallow = FALSE)
  html %>%
    read_html() %>%
    html_node("title") %>%
    html_text() %>%
    expect_equal("Title")
})
