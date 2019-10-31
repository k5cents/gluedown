library(gluedown)
library(stringr)
library(rvest)

test_that("md_softline creates one valid HTML <p> tag", {
  lines <- c("Line number one.", "And number two.")
  node <- lines %>%
    md_softline() %>%
    md_convert() %>%
    read_html() %>%
    html_nodes("p")
  expect_false(is.na(node))
  expect_length(node, 1)
})

test_that("md_softline a <p> tag with concatenated text", {
  lines <- c("Line number one.", "And number two.")
  node <- lines %>%
    md_softline() %>%
    md_convert() %>%
    read_html() %>%
    html_nodes("p") %>%
    html_text(trim = TRUE)
  concat <- str_c(lines, collapse = "\n")
  expect_length(node, 1)
  expect_equal(node, concat)
})
