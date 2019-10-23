library(testthat)
library(gluedown)
library(stringr)
library(knitr)
library(rvest)

test_that("md_break makes blocks convertable to HTML horizontal rule", {
  # define file to write to
  input <- "horizontal-rule.md"
  # create empty file
  file.create(input)
  # write file
  sink(input)
  cat("This is some text.")
  md_break(n = 10, cat = TRUE)
  cat("And this is some more text.")
  sink()
  # convert to HTML
  output <- pandoc(input, "html")
  # read HTML
  node <- read_html(output) %>%
    # find horizontal rule node
    html_node(css = "hr")
  # delete written files
  unlink(input)
  unlink(output)
  # expect list items to all be the same
  expect_false(object = is.na(node))
})
