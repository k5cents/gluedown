library(testthat)
library(gluedown)
library(stringr)
library(knitr)
library(rvest)

test_that("md_quote makes blocks convertable to HTML blockquotes", {
  quote <- "This is a block quote!"
  # define file to write to
  input <- "blockquote.md"
  # create empty file
  file.create(input)
  # write file
  sink(input)
  md_quote(quote, cat = TRUE)
  sink()
  # convert to HTML
  output <- pandoc(input, "html")
  # read HTML
  node <- read_html(output) %>%
    # find horizontal rule node
    html_node(css = "blockquote") %>%
    html_text(trim = TRUE)
  # delete written files
  unlink(input)
  unlink(output)
  # expect list items to all be the same
  expect_true(object = all(node == quote))
})
