library(testthat)
library(gluedown)
library(knitr)
library(rvest)

test_that("md_define makes a list convertable to an HTML definition list", {
  input <- "test.md"
  term <- state.abb[1:5]
  def <- state.name[1:5]
  list <- md_define(term, def)
  writeLines(list, input)
  output <- pandoc(input, "html")
  html <- read_html(output)
  unlink(input)
  unlink(output)
  read_term <- html %>%
    html_node("dl") %>%
    html_nodes("dt") %>%
    html_text(trim = TRUE)
  read_def <- html %>%
    html_node("dl") %>%
    html_nodes("dd") %>%
    html_text(trim = TRUE)
  expect_true(object = all(term == read_term & def == read_def))
})
