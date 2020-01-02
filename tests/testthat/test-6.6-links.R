library(testthat)
library(gluedown)
library(stringr)
library(rvest)
library(glue)

expect_missing <- function(object) {
  expect_true(is.na(object))
}

test_that("md_link can create a valid <href> tag (ex. 493)", {
  # https://github.github.com/gfm/#example-493
  lines <- md_link("link", "/url", "title")
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_node("a") %>%
    html_text(trim = TRUE) %>%
    expect_equal("link")
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_node("a") %>%
    html_attr("href") %>%
    expect_equal("/url")
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_node("a") %>%
    html_attr("title") %>%
    expect_equal("title")
})

test_that("md_link can create <href> tags with a named vector", {
  lines <- md_link(x = c("link" = "/url"), title = "title")
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_node("a") %>%
    html_text(trim = TRUE) %>%
    expect_equal("link")
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_node("a") %>%
    html_attr("href") %>%
    expect_equal("/url")
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_node("a") %>%
    html_attr("title") %>%
    expect_equal("title")
})

test_that("md_link can create <href> tags with a named vector", {
  lines <- md_link(x = c("link" = "/url"))
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_node("a") %>%
    html_text(trim = TRUE) %>%
    expect_equal("link")
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_node("a") %>%
    html_attr("href") %>%
    expect_equal("/url")
})

test_that("md_link can create a valid <href> without title (ex. 494)", {
  # https://github.github.com/gfm/#example-494
  lines <- md_link("link", "/url")
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_node("a") %>%
    html_text(trim = TRUE) %>%
    expect_equal("link")
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_node("a") %>%
    html_attr("href") %>%
    expect_equal("/url")
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_node("a") %>%
    html_attr("title") %>%
    expect_missing()
})

test_that("md_reference can create an <href> tag (ex. 535)", {
  # https://github.github.com/gfm/#example-535
  lines <- md_reference("bar", "/url", "title")
  md_paragraph("[foo][bar]", lines) %>%
    md_convert() %>%
    read_html() %>%
    html_node("p") %>%
    html_node("a") %>%
    html_text(trim = TRUE) %>%
    expect_equal("foo")
  md_paragraph("[foo][bar]", lines) %>%
    md_convert() %>%
    read_html() %>%
    html_node("p") %>%
    html_node("a") %>%
    html_attr("href") %>%
    expect_equal("/url")
  md_paragraph("[foo][bar]", lines) %>%
    md_convert() %>%
    read_html() %>%
    html_node("p") %>%
    html_node("a") %>%
    html_attr("title") %>%
    expect_equal("title")
})

test_that("md_reference can create an <href> tag without title (ex. 535)", {
  # https://github.github.com/gfm/#example-535
  lines <- md_reference("bar", "/url")
  md_paragraph("[foo][bar]", lines) %>%
    md_convert() %>%
    read_html() %>%
    html_node("p") %>%
    html_node("a") %>%
    html_text(trim = TRUE) %>%
    expect_equal("foo")
  md_paragraph("[foo][bar]", lines) %>%
    md_convert() %>%
    read_html() %>%
    html_node("p") %>%
    html_node("a") %>%
    html_attr("href") %>%
    expect_equal("/url")
})
