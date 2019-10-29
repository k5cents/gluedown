library(gluedown)
library(rvest)

test_that("md_hardline creates one valid HTML <br> tag", {
  lines <- c("Line number one.", "And number two.")
  node <- lines %>%
    md_hardline() %>%
    md_convert() %>%
    read_html() %>%
    html_nodes("br")
  expect_false(is.na(node))
})

test_that("md_hardline creates two valid HTML <br> tags", {
  lines <- c("Line number one.", "And number two.", "But wait there's more.")
  node <- lines %>%
    md_hardline() %>%
    md_convert() %>%
    read_html() %>%
    html_nodes("br")
  expect_length(node, 2)
})

test_that("md_hardline creates only a single HTML <p> tag", {
  node <- state.name[1:10] %>%
    md_hardline() %>%
    md_convert() %>%
    read_html() %>%
    html_nodes("p")
  expect_length(node, 1)
})
