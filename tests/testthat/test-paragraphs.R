library(gluedown)
library(rvest)

test_that("md_paragraph creates multiple valid HTML <p> tags", {
  lines <- c("Line number one.", "And number two.")
  node <- lines %>%
    md_paragraph() %>%
    md_convert() %>%
    read_html() %>%
    html_nodes("p")
  expect_false(any(is.na(node)))
  expect_length(node, 2)
})

test_that("md_paragraph creates <p> tags with text", {
  lines <- c("Line number one.", "And number two.")
  node <- lines %>%
    md_paragraph() %>%
    md_convert() %>%
    read_html() %>%
    html_nodes("p") %>%
    html_text()
  expect_equal(node, lines)
})
