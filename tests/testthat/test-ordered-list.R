library(testthat)
library(gluedown)
library(stringr)
library(knitr)
library(rvest)

test_that("md_list makes blocks convertable to HTML ordered list", {
  # define file to write to
  input <- "ordered-list.md"
  # create empty file
  file.create(input)
  # create list
  vector <- state.name[1:5]
  # write file
  sink(input)
  md_list(vector, cat = TRUE)
  sink()
  # convert to HTML
  output <- pandoc(input, "html")
  # read HTML
  node <- read_html(output) %>%
    # find unordered list node
    html_node(css = "ol") %>%
    # find list item nodes
    html_nodes(css = "li") %>%
    # convert nodes to vector
    html_text(trim = TRUE)
  # delete written files
  unlink(input)
  unlink(output)
  # expect list items to all be the same
  expect_true(object = all(node == vector))
})
