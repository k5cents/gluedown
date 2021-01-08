library(testthat)
library(gluedown)
library(stringr)
library(rvest)
library(glue)

test_that("md_task creates an <ul> list with checks (ex. 279)", {
  # https://github.github.com/gfm/#example-279
  text <- c("foo", "bar")
  lines <- md_task(text, check = 2)
  list <- lines %>%
    md_convert() %>%
    read_html() %>%
    html_node("ul") %>%
    html_nodes("li") %>%
    html_text()
  list %>%
    str_remove("\\[.*\\]\\s") %>%
    expect_equal(text)
  list %>%
    str_extract("(?<=\\[)(.*?)(?=\\])") %>%
    expect_equal(c(" ", "x"))
})

test_that("md_task creates an <ul> list without checks", {
  text <- c("foo", "bar")
  lines <- md_task(text)
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_node("ul") %>%
    html_nodes("li") %>%
    html_text() %>%
    str_remove("\\[.*\\]\\s") %>%
    expect_equal(text)
})
