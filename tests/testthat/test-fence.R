library(testthat)
library(gluedown)
library(stringr)
library(rvest)

test_that("md_chunk produced valid HTML code blocks", {
  lines <- c("library(dplyr)", "starwars %>%", "filter(species == 'Droid')")
  read <- lines %>%
    md_chunk(style = FALSE) %>%
    md_convert() %>%
    read_html() %>%
    html_node("code") %>%
    html_text(trim = TRUE)

  raw <- paste(lines, collapse = "\n")
  expect_equal(read, raw)
})

test_that("md_chunk works with styler", {
  lines <- c("library(dplyr)", "starwars %>%", "filter(species == 'Droid')")
  read <- lines %>%
    md_chunk(style = TRUE) %>%
    md_convert() %>%
    read_html() %>%
    html_node("code") %>%
    html_text(trim = TRUE)
  read <- read %>%
    str_squish() %>%
    str_replace_all("\"", "\'")
  raw <- lines %>%
    str_c(collapse = "\n") %>%
    str_remove("\\s\\s") %>%
    str_replace_all("\n", " ")
  expect_equal(read, raw)
})
