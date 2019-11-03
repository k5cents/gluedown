library(testthat)
library(gluedown)
library(rvest)
library(knitr)
library(glue)

test_that("md_define creates a <dl> tag", {
  temp <- tempfile()
  lines <- md_define("foo", "bar")
  writeLines(lines, temp)
  out <- pandoc(temp, "html")
  out %>%
    read_html() %>%
    html_node("dl") %>%
    html_node("dt") %>%
    html_text() %>%
    expect_equal("foo")
  out %>%
    read_html() %>%
    html_node("dl") %>%
    html_node("dd") %>%
    html_text(trim = TRUE) %>%
    expect_equal("bar")
})
