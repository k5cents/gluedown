library(testthat)
library(gluedown)
library(knitr)
library(rvest)

test_that("md_define makes a list convertable to an HTML definition", {
  input <- "test.md"
  term <-"term"
  def <- "definition"
  file.create(input)
  sink(input)
  md_define(term, def, cat = TRUE)
  sink()
  file.show("test.md")
  output <- pandoc(input, "html")
  html <- read_html(output)
  unlink(input)
  unlink(output)
  read_term <- html %>%
    html_node("dl") %>%
    html_node("dt") %>%
    html_text(trim = TRUE)
  read_def <- html %>%
    html_node("dl") %>%
    html_node("dd") %>%
    html_text(trim = TRUE)
  expect_true(object = all(term == read_term & def == read_def))
})
