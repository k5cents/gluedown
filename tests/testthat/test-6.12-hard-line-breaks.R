library(testthat)
library(gluedown)
library(rvest)
library(glue)

expect_empty <- function(object) {
  expect_true(length(object) == 0)
}
expect_full <- function(object) {
  expect_true(length(object) != 0)
}

test_that("md_hardline creates a <br /> tag (ex. 655)", {
  # https://github.github.com/gfm/#example-655
  x <- c("foo", "baz")
  x %>%
    md_hardline() %>%
    md_convert() %>%
    read_html() %>%
    html_node("br") %>%
    expect_full()
})
