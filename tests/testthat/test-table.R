library(testthat)
library(gluedown)
library(rvest)

test_that("md_table makes a table convertable to an HTML table", {
  df <- iris[1:10, ]
  table <- md_table(df) %>%
    as.character() %>%
    md_convert() %>%
    read_html() %>%
    html_node("table") %>%
    html_table()
  expect_true(object = all(df == table))
})
