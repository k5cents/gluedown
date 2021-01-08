library(testthat)
library(gluedown)
library(stringr)
library(glue)
library(rvest)

test_that("md_paragraph creates two simple paragraphs (ex. 189)", {
  # https://github.github.com/gfm/#example-189
  text <- c("aaa", "bbb")
  node <- text %>%
    md_paragraph() %>%
    md_convert() %>%
    find_nodes("p") %>%
    html_text()
  expect_equal(node, text)
})

test_that("md_paragraph creates two soft line paragraphs (ex. 190)", {
  # https://github.github.com/gfm/#example-190
  text <- c("aaa\nbbb", "ccc\nddd")
  lines <- md_paragraph(text)
  node <- md_convert(lines) %>% find_nodes("p") %>% html_text()
  expect_equal(text, node)
})

test_that("md_paragraph ignores extra blank lines (ex. 191)", {
  # https://github.github.com/gfm/#example-191
  lines <- md_paragraph("aaa", "\n", "bbb")
  node <- md_convert(lines) %>% find_nodes("p")
  expect_length(node, 2)
})
